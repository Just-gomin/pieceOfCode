import 'package:piece_of_test/domain/models/models.dart';
import 'package:piece_of_test/domain/repositories/repositories.dart';
import 'package:piece_of_test/domain/use_cases/use_cases.dart';

class TransferBankUseCaseImpl extends TransferBankUseCase {
  final TransferHistoryRepository transferHistoryRepository;
  final BankPort bankPort;
  final EmailPort emailPort;

  TransferBankUseCaseImpl({
    required this.transferHistoryRepository,
    required this.bankPort,
    required this.emailPort,
  });

  @override
  Future<Result<String>> call(
      ({BankAccount from, BankAccount to, double amount}) value) async {
    BankAccount from = value.from;
    BankAccount to = value.to;
    double amount = value.amount;

    if (from.bankCode == to.bankCode &&
        from.accountNumber == to.accountNumber) {
      return Result.failure(
        '동일 계좌',
        Exception('동일 계좌로 송금 불가'),
      );
    }

    // FROM 계좌의 잔액이 충분한지 검사
    final balanceOfFromBankAccount = await bankPort.getBalance(
      bankAccount: from,
    );
    if (amount > balanceOfFromBankAccount) {
      return Result.failure(
        '잔액 부족',
        Exception('잔액 부족으로 송금 불가'),
      );
    }

    // FROM 계좌에서 송금액만큼 출금
    bankPort.withdraw(bankAccount: from, amount: amount);

    // TO 계좌에 송금액만큼 입금
    Result<dynamic> response = await bankPort.deposit(
      bankAccount: to,
      amount: amount,
    );

    return response.isSuccess()
        ? () async {
            final TransferHistory transferHistory =
                await transferHistoryRepository.save(
              transferHistory: TransferHistory(
                fromBankCode: from.bankCode,
                fromBankAccountNumber: from.accountNumber,
                toBankCode: to.bankCode,
                toBankAccountNumber: to.accountNumber,
                amount: amount,
              ),
            );
            emailPort.sendEmail(
              email: Email(
                from: '우리 서비스 이메일 주소',
                to: '고객 이메일 주소',
                subject: '송금 성공',
                body: '송금 성공',
              ),
            );
            return Result<String>.success(transferHistory.id);
          }()
        : () async {
            return Result<String>.failure(
              '송금 실패',
              Exception(response.message),
            );
          }();
  }
}
