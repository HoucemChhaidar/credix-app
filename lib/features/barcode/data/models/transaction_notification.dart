class TransactionNotification {
  TransactionNotification({
    required this.transactionId,
    required this.amount,
    required this.merchantName,
    required this.timestamp,
  });

  factory TransactionNotification.fromJson(Map<String, dynamic> json) {
    return TransactionNotification(
      // @formatter:off
      transactionId: json['transactionId']?.toString() ?? '',
      amount: (json['amount'] is int) ? (json['amount'] as int).toDouble() : (json['amount'] as num?)?.toDouble() ?? 0.0,
      merchantName: json['merchantName']?.toString() ?? '',
      timestamp: DateTime.tryParse(json['timestamp']?.toString() ?? '') ?? DateTime.now(),
      // @formatter:on
    );
  }

  final String transactionId;
  final double amount;
  final String merchantName;
  final DateTime timestamp;

  Map<String, dynamic> toJson() {
    return {
      'transactionId': transactionId,
      'amount': amount,
      'merchantName': merchantName,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
