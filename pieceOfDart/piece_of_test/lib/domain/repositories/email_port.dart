import 'package:piece_of_test/domain/models/models.dart';

abstract class EmailPort {
  Future<Result> sendEmail({required Email email});
}
