import 'package:piece_of_test/domain/models/bank_account.dart';
import 'package:piece_of_test/domain/result.dart';
import 'package:piece_of_test/domain/use_cases/transfer_bank_use_case.dart';

class TransferBankUseCaseImpl extends TransferBankUseCase {
  @override
  Future<Result<String>> call(
      ({BankAccount from, BankAccount to, double amount}) value) async {
    // TODO: implement call
    throw UnimplementedError();
  }
}
