class Email {
  final String from;
  final String to;
  final String subject;
  final String body;
  late final DateTime sentAt;
  final bool isRead;
  final bool isImportant;
  final Object? attachment;

  Email({
    required this.from,
    required this.to,
    required this.subject,
    required this.body,
    DateTime? sentAt,
    this.isRead = false,
    this.isImportant = false,
    this.attachment,
  }) {
    this.sentAt = sentAt ?? DateTime.now();
  }
}
