import 'package:piece_of_test/domain/models/models.dart';

class TransferHistoryTable {
  factory TransferHistoryTable() => _instance;
  static final TransferHistoryTable _instance = TransferHistoryTable._();
  TransferHistoryTable._() {
    // Add some dummy data
    _database = <TransferHistory>[];
  }

  late final List<TransferHistory> _database;

  Future<List<TransferHistory>> findAll() async {
    return _database;
  }

  Future<List<TransferHistory>> select({
    required bool Function(TransferHistory) where,
  }) async {
    return _database.where(where).toList();
  }

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
}
