import 'package:piece_of_test/domain/models/models.dart';
import 'package:piece_of_test/domain/transfer_history_table.dart';

class TransferHistoryTableFake extends TransferHistoryTable {
  factory TransferHistoryTableFake() => _instance;
  static final TransferHistoryTableFake _instance =
      TransferHistoryTableFake._();
  TransferHistoryTableFake._() {
    // Add some dummy data
    _database = <TransferHistory>[];
  }

  late final List<TransferHistory> _database;

  @override
  Future<List<TransferHistory>> findAll() async {
    return _database;
  }

  @override
  Future<List<TransferHistory>> select({
    required bool Function(TransferHistory) where,
  }) async {
    return _database.where(where).toList();
  }

  @override
  Future<TransferHistory> insert(TransferHistory transferHistory) async {
    TransferHistory newTransferHistory = TransferHistory(
      id: _database.length.toString(),
      fromBankCode: transferHistory.fromBankCode,
      fromBankAccountNumber: transferHistory.fromBankAccountNumber,
      toBankCode: transferHistory.toBankCode,
      toBankAccountNumber: transferHistory.toBankAccountNumber,
      amount: transferHistory.amount,
    );
    _database.add(newTransferHistory);
    return newTransferHistory;
  }

  @override
  void deleteAll() {
    _database.clear();
  }
}
