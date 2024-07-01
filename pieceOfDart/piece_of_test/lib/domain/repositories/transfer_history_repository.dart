import 'package:piece_of_test/domain/models/models.dart';

abstract class TransferHistoryRepository {
  Future<TransferHistory?> findById({required String id});
  Future<TransferHistory> save({required TransferHistory transferHistory});
}
