import 'dart:math';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:piece_of_test/piece_of_test.dart';
import 'package:test/test.dart';

@GenerateNiceMocks([
  MockSpec<TransferHistoryRepository>(),
  MockSpec<BankPort>(),
  MockSpec<EmailPort>()
])
import 'piece_of_test_test.mocks.dart';

void main() {
  group('FROM 계좌 잔액 확인', () {
    BankAccount fromBankAccount = BankAccount(
      bankCode: '088',
      accountNumber: '1212121212',
    );
    BankAccount toBankAccount = BankAccount(
      bankCode: '088',
      accountNumber: '4242424242',
    );
    TransferHistoryRepository transferHistoryRepositoryStub =
        MockTransferHistoryRepository();
    EmailPort emailPortStub = MockEmailPort();

    setUp(() {});

    test('FROM 계좌 잔액이 부족하면 Failure 리턴', () async {
      BankPort bankPortStub = MockBankPort();
      when(bankPortStub.getBalance(
        bankAccount: fromBankAccount,
      )).thenAnswer((_) => Future.value(pow(10.0, 6).toDouble()));

      TransferBankUseCase sut = TransferBankUseCaseImpl(
        transferHistoryRepository: MockTransferHistoryRepository(),
        bankPort: bankPortStub,
        emailPort: MockEmailPort(),
      );

      Result<String> result = await sut.call((
        from: fromBankAccount,
        to: toBankAccount,
        amount: pow(10.0, 9).toDouble(),
      ));

      expect(result.isSuccess(), false);
    });

    test('FROM 계좌 잔액이 충분하면 Success 리턴', () async {
      BankPort bankPortStub = MockBankPort();
      when(bankPortStub.getBalance(
        bankAccount: BankAccount(bankCode: '088', accountNumber: '1212121212'),
      )).thenAnswer((_) => Future.value(pow(10.0, 6).toDouble()));

      TransferBankUseCase sut = TransferBankUseCaseImpl(
        transferHistoryRepository: MockTransferHistoryRepository(),
        bankPort: bankPortStub,
        emailPort: MockEmailPort(),
      );

      Result<String> result = await sut.call((
        from: BankAccount(bankCode: '088', accountNumber: '1212121212'),
        to: BankAccount(bankCode: '088', accountNumber: '4242424242'),
        amount: pow(10.0, 5).toDouble(),
      ));

      expect(result.isSuccess(), true);
    });
  });
}
