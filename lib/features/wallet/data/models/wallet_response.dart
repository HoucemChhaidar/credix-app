class WalletResponse {

  const WalletResponse({
    required this.tokenizedId,
    required this.balance,
    required this.isActive,
    required this.userEmail,
    required this.createdAt,
  });
  factory WalletResponse.fromJson(Map<String, dynamic> json) {
    return WalletResponse(
      tokenizedId: json['tokenizedId'] as String,
      balance: (json['balance'] as num).toDouble(),
      isActive: json['isActive'] as bool,
      userEmail: json['userEmail'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  final String tokenizedId;
  final double balance;
  final bool isActive;
  final String userEmail;
  final DateTime createdAt;

  Map<String, dynamic> toJson() {
    return {
      'tokenizedId': tokenizedId,
      'balance': balance,
      'isActive': isActive,
      'userEmail': userEmail,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'WalletModel(tokenizedId: $tokenizedId, balance: $balance, isActive: $isActive, userEmail: $userEmail, createdAt: $createdAt)';
  }
}
