import 'dart:math';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:piece_of_test/data/transfer_history_table_fake.dart';
import 'package:piece_of_test/piece_of_test.dart';
import 'package:test/test.dart';

@GenerateMocks([
  TransferHistoryRepository,
  BankPort,
  EmailPort,
])
import 'piece_of_test_test.mocks.dart';

void main() {
  BankAccount fromBankAccount = BankAccount(
    bankCode: '088',
    accountNumber: '1212121212',
  );

  BankAccount toBankAccount = BankAccount(
    bankCode: '088',
    accountNumber: '4242424242',
  );

  final double million = pow(10.0, 6).toDouble();
  final double billion = pow(10.0, 9).toDouble();

  final Email email = Email(
    from: '우리 서비스 이메일 주소',
    to: '고객 이메일 주소',
    subject: '송금 성공',
    body: '송금 성공',
  );

  group('test code sampling', () {
    setUp(() {
      TransferHistoryTableFake().deleteAll();
    });

    test('FROM 계좌 잔액이 부족하면 Failure 리턴', () async {
      BankPort bankPortStub = MockBankPort();
      when(bankPortStub.getBalance(
        bankAccount: fromBankAccount,
      )).thenAnswer((_) => Future.value(million));

      TransferBankUseCase sut = TransferBankUseCaseImpl(
        transferHistoryRepository: MockTransferHistoryRepository(), // Dummy
        bankPort: bankPortStub,
        emailPort: MockEmailPort(), // Dummy
      );

      Result<String> result = await sut.call((
        from: fromBankAccount,
        to: toBankAccount,
        amount: billion,
      ));

      expect(result.isSuccess(), false);
    });

    test('송금을 성공하면 이메일을 한 번 발송', () async {
      TransferHistory transferHistory = TransferHistory(
        fromBankCode: fromBankAccount.bankCode,
        fromBankAccountNumber: fromBankAccount.accountNumber,
        toBankCode: toBankAccount.bankCode,
        toBankAccountNumber: toBankAccount.accountNumber,
        amount: million,
      );
      TransferHistoryRepository transferHistoryRepositoryStub =
          MockTransferHistoryRepository();
      when(transferHistoryRepositoryStub.save(transferHistory: transferHistory))
          .thenAnswer((_) => Future.value(transferHistory));

      BankPort bankPortStub = MockBankPort();
      when(bankPortStub.getBalance(
        bankAccount: fromBankAccount,
      )).thenAnswer((_) => Future.value(million));
      when(bankPortStub.withdraw(bankAccount: fromBankAccount, amount: million))
          .thenAnswer((_) => Future.value(Result.success("Success")));
      when(bankPortStub.deposit(bankAccount: toBankAccount, amount: million))
          .thenAnswer((_) => Future.value(Result.success("Success")));

      int emailCount = 0;

      EmailPort emailPortSpy = MockEmailPort();
      when(emailPortSpy.sendEmail(email: email)).thenAnswer((_) {
        emailCount++;
        return Future.value(Result.success("Success"));
      });

      TransferBankUseCase sut = TransferBankUseCaseImpl(
        transferHistoryRepository: transferHistoryRepositoryStub,
        bankPort: bankPortStub,
        emailPort: emailPortSpy,
      );

      Result<String> _ = await sut.call((
        from: fromBankAccount,
        to: toBankAccount,
        amount: million,
      ));

      expect(emailCount, 1); // Spy 방식으로 확인
      // verify(emailPortSpy.sendEmail(email: emailToFromBankAccount)).called(1); // 함수가 호출된 횟수로 확인
    });

    test('송금 성공', () async {
      TransferHistory transferHistory = TransferHistory(
        fromBankCode: fromBankAccount.bankCode,
        fromBankAccountNumber: fromBankAccount.accountNumber,
        toBankCode: toBankAccount.bankCode,
        toBankAccountNumber: toBankAccount.accountNumber,
        amount: million,
      );
      TransferHistoryRepository transferHistoryRepositoryStub =
          MockTransferHistoryRepository();
      when(transferHistoryRepositoryStub.save(transferHistory: transferHistory))
          .thenAnswer((_) => Future.value(transferHistory));

      BankPort bankPortMock = MockBankPort();
      when(bankPortMock.getBalance(bankAccount: fromBankAccount))
          .thenAnswer((_) => Future.value(billion));
      when(bankPortMock.withdraw(bankAccount: fromBankAccount, amount: million))
          .thenAnswer((_) => Future.value(Result.success("Success")));
      when(bankPortMock.deposit(bankAccount: toBankAccount, amount: million))
          .thenAnswer((_) => Future.value(Result.success("Success")));

      EmailPort emailPort = MockEmailPort();
      when(emailPort.sendEmail(email: email))
          .thenAnswer((_) => Future.value(Result.success("Success")));

      TransferBankUseCase sut = TransferBankUseCaseImpl(
        transferHistoryRepository: transferHistoryRepositoryStub,
        bankPort: bankPortMock,
        emailPort: emailPort,
      );

      Result<String> result = await sut.call((
        from: fromBankAccount,
        to: toBankAccount,
        amount: million,
      ));

      expect(result.isSuccess(), true);
    });
  });
}
