import 'dart:async';

import 'package:piece_of_test/domain/repositories/repositories.dart';
import 'package:piece_of_test/clients/clients.dart';
import 'package:piece_of_test/domain/models/models.dart';

class BankPortHttp extends BankPort {
  final HttpClient httpClient;

  BankPortHttp({
    required this.httpClient,
  });

  @override
  FutureOr<Result> deposit({
    required BankAccount bankAccount,
    required double amount,
  }) async {
    return await httpClient.deposit(
      bankCode: bankAccount.bankCode,
      accountNumber: bankAccount.accountNumber,
      amount: amount,
    );
  }

  @override
  FutureOr<double> getBalance({
    required BankAccount bankAccount,
  }) async {
    return await httpClient.getBalance(
      bankCode: bankAccount.bankCode,
      accountNumber: bankAccount.accountNumber,
    );
  }

  @override
  FutureOr<Result> withdraw({
    required BankAccount bankAccount,
    required double amount,
  }) async {
    return await httpClient.withdraw(
      bankCode: bankAccount.bankCode,
      accountNumber: bankAccount.accountNumber,
      amount: amount,
    );
  }
}
