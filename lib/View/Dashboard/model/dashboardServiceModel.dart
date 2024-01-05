class DashboardServiceModel {
  DashboardServiceModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final DashData? data;

  factory DashboardServiceModel.fromJson(Map<String, dynamic> json) {
    return DashboardServiceModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : DashData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class DashData {
  DashData({
    required this.totalSale,
    required this.soldOut,
    required this.totalProduct,
    required this.totalOrders,
    required this.totalCustomers,
    required this.stockManagement,
    required this.totalDelivery,
    required this.ratingsNdReviews,
    required this.graphData,
    required this.categoryProduct,
  });

  final String? totalSale;
  final String? soldOut;
  final String? totalProduct;
  final String? totalOrders;
  final String? totalCustomers;
  final String? stockManagement;
  final String? totalDelivery;
  final String? ratingsNdReviews;
  final GraphData? graphData;
  final List<dynamic> categoryProduct;

  factory DashData.fromJson(Map<String, dynamic> json) {
    return DashData(
      totalSale: json["total_sale"],
      soldOut: json["sold_out"],
      totalProduct: json["total_product"],
      totalOrders: json["total_orders"],
      totalCustomers: json["total_customers"],
      stockManagement: json["stock_management"],
      totalDelivery: json["total_delivery"],
      ratingsNdReviews: json["ratings_nd_reviews"],
      graphData: json["graph_data"] == null
          ? null
          : GraphData.fromJson(json["graph_data"]),
      categoryProduct: json["category_product"] == null
          ? []
          : List<dynamic>.from(json["category_product"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "total_sale": totalSale,
        "sold_out": soldOut,
        "total_product": totalProduct,
        "total_orders": totalOrders,
        "total_customers": totalCustomers,
        "stock_management": stockManagement,
        "total_delivery": totalDelivery,
        "ratings_nd_reviews": ratingsNdReviews,
        "graph_data": graphData?.toJson(),
        "category_product": categoryProduct.map((x) => x).toList(),
      };
}

class GraphData {
  GraphData({
    required this.sellerLabel,
    required this.sellerEarn,
  });

  final List<String> sellerLabel;
  final List<dynamic> sellerEarn;

  factory GraphData.fromJson(Map<String, dynamic> json) {
    return GraphData(
      sellerLabel: json["seller_label"] == null
          ? []
          : List<String>.from(json["seller_label"]!.map((x) => x)),
      sellerEarn: json["seller_earn"] == null
          ? []
          : List<dynamic>.from(json["seller_earn"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "seller_label": sellerLabel.map((x) => x).toList(),
        "seller_earn": sellerEarn.map((x) => x).toList(),
      };
}
