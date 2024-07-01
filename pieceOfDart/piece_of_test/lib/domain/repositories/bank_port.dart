import 'dart:async';

import 'package:piece_of_test/domain/models/models.dart';

abstract class BankPort {
  /// 게좌 잔액 조회
  FutureOr<double> getBalance({
    required BankAccount bankAccount,
  });

  /// 계좌에서 금액 출금
  FutureOr<Result> withdraw({
    required BankAccount bankAccount,
    required double amount,
  });

  /// 계좌에 금액 입금
  FutureOr<Result> deposit({
    required BankAccount bankAccount,
    required double amount,
  });
}
