import 'package:piece_of_test/domain/models/models.dart';
import 'package:piece_of_test/domain/repositories/repositories.dart';
import 'package:piece_of_test/domain/transfer_history_table.dart';

class TransferHistoryRepositoryImpl extends TransferHistoryRepository {
  final TransferHistoryTable _transferHistoryTable;

  TransferHistoryRepositoryImpl({
    required TransferHistoryTable transferHistoryTable,
  }) : _transferHistoryTable = transferHistoryTable;

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
    TransferHistory newTransferHistory = await _transferHistoryTable.insert(
      transferHistory,
    );
    return newTransferHistory;
  }
}
