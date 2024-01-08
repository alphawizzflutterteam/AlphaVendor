class TransactionModel {
  TransactionModel({
    required this.status,
    required this.message,
    required this.withdrawalAmount,
    required this.data,
  });

  final bool? status;
  final String? message;
  final String? withdrawalAmount;
  final List<Transaction> data;

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      status: json["status"],
      message: json["message"],
      withdrawalAmount: json["withdrawal_amount"],
      data: json["data"] == null
          ? []
          : List<Transaction>.from(
              json["data"]!.map((x) => Transaction.fromJson(x))),
    );
  }
}

class Transaction {
  Transaction({
    required this.id,
    required this.sellerId,
    required this.deliveryManId,
    required this.adminId,
    required this.amount,
    required this.withdrawalMethodId,
    required this.withdrawalMethodFields,
    required this.transactionNote,
    required this.approved,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? sellerId;
  final int? deliveryManId;
  final int? adminId;
  final String? amount;
  final String? withdrawalMethodId;
  final List<dynamic> withdrawalMethodFields;
  final String? transactionNote;
  final int? approved;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json["id"],
      sellerId: json["seller_id"],
      deliveryManId: json["delivery_man_id"],
      adminId: json["admin_id"],
      amount: json["amount"],
      withdrawalMethodId: json["withdrawal_method_id"],
      withdrawalMethodFields: json["withdrawal_method_fields"] == null
          ? []
          : List<dynamic>.from(json["withdrawal_method_fields"]!.map((x) => x)),
      transactionNote: json["transaction_note"],
      approved: json["approved"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }
}
