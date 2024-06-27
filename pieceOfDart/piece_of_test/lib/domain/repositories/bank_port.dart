import 'dart:async';

import 'package:piece_of_test/domain/result.dart';

abstract class BankPort {
  /// 게좌 잔액 조회
  FutureOr<double> getBalance({
    required String bankCode,
    required String accountNumber,
  });

  /// 계좌에서 금액 출금
  FutureOr<Result> withdraw({
    required String bankCode,
    required String accountNumber,
    required double amount,
  });

  /// 계좌에 금액 입금
  FutureOr<Result> deposit({
    required String bankCode,
    required String accountNumber,
    required double amount,
  });
}
