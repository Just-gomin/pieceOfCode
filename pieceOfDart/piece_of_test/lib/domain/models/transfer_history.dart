class TransferHistory {
  final String id;
  final String fromBankCode;
  final String fromBankAccountNumber;
  final String toBankCode;
  final String toBankAccountNumber;
  final double amount;

  TransferHistory({
    this.id = '',
    required this.fromBankCode,
    required this.fromBankAccountNumber,
    required this.toBankCode,
    required this.toBankAccountNumber,
    required this.amount,
  });

  TransferHistory.empty()
      : id = '',
        fromBankCode = '',
        fromBankAccountNumber = '',
        toBankCode = '',
        toBankAccountNumber = '',
        amount = 0.0;
}
