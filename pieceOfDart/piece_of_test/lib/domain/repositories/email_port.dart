import 'package:piece_of_test/domain/models/email.dart';
import 'package:piece_of_test/domain/result.dart';

abstract class EmailPort {
  Future<Result> sendEmail({required Email email});
}
