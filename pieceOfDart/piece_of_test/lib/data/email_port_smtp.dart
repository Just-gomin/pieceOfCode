import 'dart:async';

import 'package:piece_of_test/clients/smtp_client.dart';
import 'package:piece_of_test/domain/models/email.dart';
import 'package:piece_of_test/domain/result.dart';

class EmailPortSmtp {
  final SmtpClient smtpClient;
  EmailPortSmtp({
    required this.smtpClient,
  });

  FutureOr<Result> sendEmail({
    required Email email,
  }) async {
    return await smtpClient.sendEmail(
      email: email,
    );
  }
}
