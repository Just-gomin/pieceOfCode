import 'package:piece_of_test/domain/models/models.dart';

abstract class TransferHistoryTable {
  Future<List<TransferHistory>> findAll();

  Future<List<TransferHistory>> select({
    required bool Function(TransferHistory) where,
  });
  Future<TransferHistory> insert(TransferHistory transferHistory);
  void deleteAll();
}
