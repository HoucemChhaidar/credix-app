class TransactionResponse {
  TransactionResponse({
    this.id,
    this.transactionId,
    this.userEmail,
    this.walletTokenizedId,
    this.amount,
    this.status,
    this.type,
    this.merchantName,
    this.merchantId,
    this.description,
    this.failureReason,
    this.balanceBefore,
    this.balanceAfter,
    this.createdAt,
    this.completedAt,
  });

  factory TransactionResponse.fromJson(Map<String, dynamic> json) {
    return TransactionResponse(
      id: json['id'] as int?,
      transactionId: json['transactionId'] as String?,
      userEmail: json['userEmail'] as String?,
      walletTokenizedId: json['walletTokenizedId'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      status: json['status'] as String?,
      type: json['type'] as String?,
      merchantName: json['merchantName'] as String?,
      merchantId: json['merchantId'] as String?,
      description: json['description'] as String?,
      failureReason: json['failureReason'] as String?,
      balanceBefore: json['balanceBefore'] as double?,
      balanceAfter: json['balanceAfter'] as double?,
      createdAt: json['createdAt'] as String?,
      completedAt: json['completedAt'] as String?,
    );
  }

  final int? id;
  final String? transactionId;
  final String? userEmail;
  final String? walletTokenizedId;
  final double? amount;
  final String? status;
  final String? type;
  final String? merchantName;
  final String? merchantId;
  final String? description;
  final String? failureReason;
  final double? balanceBefore;
  final double? balanceAfter;
  final String? createdAt;
  final String? completedAt;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'transactionId': transactionId,
      'userEmail': userEmail,
      'walletTokenizedId': walletTokenizedId,
      'amount': amount,
      'status': status,
      'type': type,
      'merchantName': merchantName,
      'merchantId': merchantId,
      'description': description,
      'failureReason': failureReason,
      'balanceBefore': balanceBefore,
      'balanceAfter': balanceAfter,
      'createdAt': createdAt,
      'completedAt': completedAt,
    };
  }
}
