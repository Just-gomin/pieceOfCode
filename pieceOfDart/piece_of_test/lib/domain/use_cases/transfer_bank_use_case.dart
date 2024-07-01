import 'package:piece_of_test/domain/models/models.dart';
import 'package:piece_of_test/domain/use_cases/use_case.dart';

abstract class TransferBankUseCase extends UseCase<Future<Result<String>>,
    ({BankAccount from, BankAccount to, double amount})> {
  @override
  Future<Result<String>> call(
    ({BankAccount from, BankAccount to, double amount}) value,
  );
}
