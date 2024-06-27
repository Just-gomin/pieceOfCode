import 'dart:async';

import 'package:piece_of_test/domain/repositories/bank_port.dart';
import 'package:piece_of_test/clients/clients.dart';
import 'package:piece_of_test/domain/result.dart';

class BankPortHttp extends BankPort {
  final HttpClient httpClient;

  BankPortHttp({
    required this.httpClient,
  });

  @override
  FutureOr<Result> deposit({
    required String bankCode,
    required String accountNumber,
    required double amount,
  }) async {
    return await httpClient.deposit(
      bankCode: bankCode,
      accountNumber: accountNumber,
      amount: amount,
    );
  }

  @override
  FutureOr<double> getBalance({
    required String bankCode,
    required String accountNumber,
  }) async {
    return await httpClient.getBalance(
      bankCode: bankCode,
      accountNumber: accountNumber,
    );
  }

  @override
  FutureOr<Result> withdraw({
    required String bankCode,
    required String accountNumber,
    required double amount,
  }) async {
    return await httpClient.withdraw(
      bankCode: bankCode,
      accountNumber: accountNumber,
      amount: amount,
    );
  }
}
