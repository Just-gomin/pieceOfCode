import 'package:piece_of_test/data/transfer_history_table.dart';
import 'package:piece_of_test/domain/models/models.dart';
import 'package:piece_of_test/domain/repositories/repositories.dart';

class TransferHistoryRepositoryImpl extends TransferHistoryRepository {
  final TransferHistoryTable _transferHistoryTable = TransferHistoryTable();

  @override
  Future<TransferHistory?> findById({
    required String id,
  }) async {
    final transferHistories = await _transferHistoryTable.select(
      where: (transferHistory) => transferHistory.id == id,
    );
    return transferHistories.isNotEmpty ? transferHistories.first : null;
  }

  @override
  Future<TransferHistory> save({
    required TransferHistory transferHistory,
  }) async {
    _transferHistoryTable.insert(transferHistory);
    return transferHistory;
  }
}
