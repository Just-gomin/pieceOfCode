class TransferHistory {
  final String id;
  final String fromBankCode;
  final String fromBankAccountNumber;
  final String toBankCode;
  final String toBankAccountNumber;
  final double amount;
  final DateTime createdAt;

  TransferHistory({
    this.id = '',
    required this.fromBankCode,
    required this.fromBankAccountNumber,
    required this.toBankCode,
    required this.toBankAccountNumber,
    required this.amount,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  TransferHistory.empty()
      : id = '',
        fromBankCode = '',
        fromBankAccountNumber = '',
        toBankCode = '',
        toBankAccountNumber = '',
        amount = 0.0,
        createdAt = DateTime.now();

  @override
  int get hashCode => createdAt.hashCode;

  @override
  bool operator ==(covariant TransferHistory other) {
    return fromBankCode == other.fromBankCode &&
        fromBankAccountNumber == other.fromBankAccountNumber &&
        toBankCode == other.toBankCode &&
        toBankAccountNumber == other.toBankAccountNumber &&
        amount == other.amount;
  }
}
