import 'dart:async';

import 'package:piece_of_test/clients/clients.dart';
import 'package:piece_of_test/domain/models/models.dart';

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
