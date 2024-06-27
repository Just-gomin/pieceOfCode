import 'dart:async';

import 'package:piece_of_test/domain/models/email.dart';
import 'package:piece_of_test/domain/result.dart';

class SmtpClient {
  FutureOr<Result> sendEmail({
    required Email email,
  }) async {
    return Result.success(null);
  }
}
