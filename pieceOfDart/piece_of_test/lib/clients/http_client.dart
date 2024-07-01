import 'dart:async';

import 'package:piece_of_test/domain/models/result.dart';

/// 은행 API 호출 인터페이스
class HttpClient {
  /// 게좌 잔액 조회
  FutureOr<double> getBalance({
    required String bankCode,
    required String accountNumber,
  }) async {
    return 0;
  }

  /// 계좌에서 금액 출금
  FutureOr<Result> withdraw({
    required String bankCode,
    required String accountNumber,
    required double amount,
  }) async {
    return Result.success(null);
  }

  /// 계좌에 금액 입금
  FutureOr<Result> deposit({
    required String bankCode,
    required String accountNumber,
    required double amount,
  }) async {
    return Result.success(null);
  }
}
