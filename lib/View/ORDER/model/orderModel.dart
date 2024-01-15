class OrderModel {
  OrderModel({
    required this.status,
    required this.message,
    required this.data,
    required this.orderStatus,
  });

  final bool? status;
  final String? message;
  final List<OrderData> data;
  final List<OrderStatus> orderStatus;

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<OrderData>.from(
              json["data"]!.map((x) => OrderData.fromJson(x))),
      orderStatus: json["order_status"] == null
          ? []
          : List<OrderStatus>.from(
              json["order_status"]!.map((x) => OrderStatus.fromJson(x))),
    );
  }
}

class OrderData {
  OrderData({
    required this.orderId,
    required this.orderStatus,
    required this.orderDate,
    required this.orderAmount,
    required this.isAlphaDelivery,
    required this.shippingAddressData,
    required this.billingAddressData,
    required this.detail,
    required this.priceDetail,
    required this.customer,
  });

  final int? orderId;
  final String? orderStatus;
  final String? orderDate;
  final String? orderAmount;
  final bool? isAlphaDelivery;
  final IngAddressData? shippingAddressData;
  final IngAddressData? billingAddressData;
  final Detail? detail;
  final PriceDetail? priceDetail;
  final String? customer;

  factory OrderData.fromJson(Map<String, dynamic> json) {
    return OrderData(
      orderId: json["order_id"],
      orderStatus: json["order_status"],
      orderDate: json["order_date"],
      orderAmount: json["order_amount"],
      isAlphaDelivery: json["is_alpha_delivery"],
      shippingAddressData: json["shipping_address_data"] == null
          ? null
          : IngAddressData.fromJson(json["shipping_address_data"]),
      billingAddressData: json["billing_address_data"] == null
          ? null
          : IngAddressData.fromJson(json["billing_address_data"]),
      detail: json["detail"] == null ? null : Detail.fromJson(json["detail"]),
      priceDetail: json["price_detail"] == null
          ? null
          : PriceDetail.fromJson(json["price_detail"]),
      customer: json["customer"],
    );
  }
}

class IngAddressData {
  IngAddressData({
    required this.id,
    required this.customerId,
    required this.contactPersonName,
    required this.addressType,
    required this.address,
    required this.address1,
    required this.city,
    required this.zip,
    required this.phone,
    required this.altPhone,
    required this.createdAt,
    required this.updatedAt,
    required this.state,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.isBilling,
  });

  final String? id;
  final String? customerId;
  final String? contactPersonName;
  final String? addressType;
  final String? address;
  final String? address1;
  final String? city;
  final String? zip;
  final String? phone;
  final String? altPhone;
  final String? createdAt;
  final String? updatedAt;
  final String? state;
  final String? country;
  final String? latitude;
  final String? longitude;
  final String? isBilling;

  factory IngAddressData.fromJson(Map<String, dynamic> json) {
    return IngAddressData(
      id: json["id"],
      customerId: json["customer_id"],
      contactPersonName: json["contact_person_name"],
      addressType: json["address_type"],
      address: json["address"],
      address1: json["address1"],
      city: json["city"],
      zip: json["zip"],
      phone: json["phone"],
      altPhone: json["alt_phone"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      state: json["state"],
      country: json["country"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      isBilling: json["is_billing"],
    );
  }
}

class Detail {
  Detail({
    required this.id,
    required this.categoryIds,
    required this.userId,
    required this.shop,
    required this.name,
    required this.slug,
    required this.images,
    required this.colorImage,
    required this.thumbnail,
    required this.brandId,
    required this.unit,
    required this.minQty,
    required this.featured,
    required this.refundable,
    required this.variantProduct,
    required this.attributes,
    required this.choiceOptions,
    required this.variation,
    required this.weight,
    required this.published,
    required this.unitPrice,
    required this.specialPrice,
    required this.purchasePrice,
    required this.tax,
    required this.taxType,
    required this.taxModel,
    required this.taxAmount,
    required this.discount,
    required this.discountType,
    required this.currentStock,
    required this.minimumOrderQty,
    required this.freeShipping,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.featuredStatus,
    required this.metaTitle,
    required this.metaDescription,
    required this.metaImage,
    required this.requestStatus,
    required this.shippingCost,
    required this.multiplyQty,
    required this.code,
    required this.reviewsCount,
    required this.rating,
    required this.tags,
    required this.translations,
    required this.shareLink,
    required this.reviews,
    required this.colorsFormatted,
    required this.isFavorite,
    required this.isCart,
    required this.cartId,
    required this.manufacturingDate,
    required this.madeIn,
    required this.warranty,
    required this.useCoinsWithAmount,
    required this.amountAfterCoinUse,
  });

  final int? id;
  final List<CategoryId> categoryIds;
  final int? userId;
  final Shop? shop;
  final String? name;
  final String? slug;
  final List<String> images;
  final List<dynamic> colorImage;
  final String? thumbnail;
  final int? brandId;
  final String? unit;
  final int? minQty;
  final int? featured;
  final String? refundable;
  final int? variantProduct;
  final List<dynamic> attributes;
  final List<dynamic> choiceOptions;
  final List<dynamic> variation;
  final String? weight;
  final int? published;
  final String? unitPrice;
  final String? specialPrice;
  final String? purchasePrice;
  final int? tax;
  final String? taxType;
  final String? taxModel;
  final String? taxAmount;
  final int? discount;
  final String? discountType;
  final int? currentStock;
  final int? minimumOrderQty;
  final int? freeShipping;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? status;
  final int? featuredStatus;
  final String? metaTitle;
  final String? metaDescription;
  final String? metaImage;
  final int? requestStatus;
  final String? shippingCost;
  final int? multiplyQty;
  final String? code;
  final int? reviewsCount;
  final List<Rating> rating;
  final List<dynamic> tags;
  final List<dynamic> translations;
  final String? shareLink;
  final List<Review> reviews;
  final List<dynamic> colorsFormatted;
  final bool? isFavorite;
  final bool? isCart;
  final int? cartId;
  final DateTime? manufacturingDate;
  final String? madeIn;
  final String? warranty;
  final String? useCoinsWithAmount;
  final String? amountAfterCoinUse;

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      id: json["id"],
      categoryIds: json["category_ids"] == null
          ? []
          : List<CategoryId>.from(
              json["category_ids"]!.map((x) => CategoryId.fromJson(x))),
      userId: json["user_id"],
      shop: json["shop"] == null ? null : Shop.fromJson(json["shop"]),
      name: json["name"],
      slug: json["slug"],
      images: json["images"] == null
          ? []
          : List<String>.from(json["images"]!.map((x) => x)),
      colorImage: json["color_image"] == null
          ? []
          : List<dynamic>.from(json["color_image"]!.map((x) => x)),
      thumbnail: json["thumbnail"],
      brandId: json["brand_id"],
      unit: json["unit"],
      minQty: json["min_qty"],
      featured: json["featured"],
      refundable: json["refundable"],
      variantProduct: json["variant_product"],
      attributes: json["attributes"] == null
          ? []
          : List<dynamic>.from(json["attributes"]!.map((x) => x)),
      choiceOptions: json["choice_options"] == null
          ? []
          : List<dynamic>.from(json["choice_options"]!.map((x) => x)),
      variation: json["variation"] == null
          ? []
          : List<dynamic>.from(json["variation"]!.map((x) => x)),
      weight: json["weight"],
      published: json["published"],
      unitPrice: json["unit_price"],
      specialPrice: json["special_price"],
      purchasePrice: json["purchase_price"],
      tax: json["tax"],
      taxType: json["tax_type"],
      taxModel: json["tax_model"],
      taxAmount: json["tax_amount"],
      discount: json["discount"],
      discountType: json["discount_type"],
      currentStock: json["current_stock"],
      minimumOrderQty: json["minimum_order_qty"],
      freeShipping: json["free_shipping"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      status: json["status"],
      featuredStatus: json["featured_status"],
      metaTitle: json["meta_title"],
      metaDescription: json["meta_description"],
      metaImage: json["meta_image"],
      requestStatus: json["request_status"],
      shippingCost: json["shipping_cost"],
      multiplyQty: json["multiply_qty"],
      code: json["code"],
      reviewsCount: json["reviews_count"],
      rating: json["rating"] == null
          ? []
          : List<Rating>.from(json["rating"]!.map((x) => Rating.fromJson(x))),
      tags: json["tags"] == null
          ? []
          : List<dynamic>.from(json["tags"]!.map((x) => x)),
      translations: json["translations"] == null
          ? []
          : List<dynamic>.from(json["translations"]!.map((x) => x)),
      shareLink: json["share_link"],
      reviews: json["reviews"] == null
          ? []
          : List<Review>.from(json["reviews"]!.map((x) => Review.fromJson(x))),
      colorsFormatted: json["colors_formatted"] == null
          ? []
          : List<dynamic>.from(json["colors_formatted"]!.map((x) => x)),
      isFavorite: json["is_favorite"],
      isCart: json["is_cart"],
      cartId: json["cart_id"],
      manufacturingDate: DateTime.tryParse(json["manufacturing_date"] ?? ""),
      madeIn: json["made_in"],
      warranty: json["warranty"],
      useCoinsWithAmount: json["use_coins_with_amount"],
      amountAfterCoinUse: json["amount_after_coin_use"],
    );
  }
}

class CategoryId {
  CategoryId({
    required this.id,
    required this.position,
  });

  final String? id;
  final int? position;

  factory CategoryId.fromJson(Map<String, dynamic> json) {
    return CategoryId(
      id: json["id"],
      position: json["position"],
    );
  }
}

class Rating {
  Rating({
    required this.average,
    required this.productId,
  });

  final String? average;
  final int? productId;

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      average: json["average"],
      productId: json["product_id"],
    );
  }
}

class Review {
  Review({
    required this.id,
    required this.productId,
    required this.customerId,
    required this.deliveryManId,
    required this.orderId,
    required this.comment,
    required this.attachment,
    required this.rating,
    required this.status,
    required this.isSaved,
    required this.createdAt,
    required this.updatedAt,
    required this.customer,
  });

  final int? id;
  final int? productId;
  final int? customerId;
  final String? deliveryManId;
  final String? orderId;
  final String? comment;
  final List<dynamic> attachment;
  final int? rating;
  final int? status;
  final int? isSaved;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Customer? customer;

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json["id"],
      productId: json["product_id"],
      customerId: json["customer_id"],
      deliveryManId: json["delivery_man_id"],
      orderId: json["order_id"],
      comment: json["comment"],
      attachment: json["attachment"] == null
          ? []
          : List<dynamic>.from(json["attachment"]!.map((x) => x)),
      rating: json["rating"],
      status: json["status"],
      isSaved: json["is_saved"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      customer:
          json["customer"] == null ? null : Customer.fromJson(json["customer"]),
    );
  }
}

class Customer {
  Customer({
    required this.id,
    required this.name,
    required this.image,
  });

  final int? id;
  final String? name;
  final String? image;

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json["id"],
      name: json["name"],
      image: json["image"],
    );
  }
}

class Shop {
  Shop({
    required this.id,
    required this.sellerId,
    required this.name,
    required this.address,
    required this.contact,
    required this.image,
    required this.bottomBanner,
    required this.vacationStartDate,
    required this.vacationEndDate,
    required this.vacationNote,
    required this.vacationStatus,
    required this.temporaryClose,
    required this.createdAt,
    required this.updatedAt,
    required this.rating,
    required this.followers,
    required this.isVerified,
    required this.isFollowing,
    required this.banner,
  });

  final int? id;
  final int? sellerId;
  final String? name;
  final String? address;
  final String? contact;
  final String? image;
  final String? bottomBanner;
  final String? vacationStartDate;
  final String? vacationEndDate;
  final String? vacationNote;
  final int? vacationStatus;
  final int? temporaryClose;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? rating;
  final String? followers;
  final String? isVerified;
  final String? isFollowing;
  final String? banner;

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      id: json["id"],
      sellerId: json["seller_id"],
      name: json["name"],
      address: json["address"],
      contact: json["contact"],
      image: json["image"],
      bottomBanner: json["bottom_banner"],
      vacationStartDate: json["vacation_start_date"],
      vacationEndDate: json["vacation_end_date"],
      vacationNote: json["vacation_note"],
      vacationStatus: json["vacation_status"],
      temporaryClose: json["temporary_close"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      rating: json["rating"],
      followers: json["followers"],
      isVerified: json["is_verified"],
      isFollowing: json["is_following"],
      banner: json["banner"],
    );
  }
}

class PriceDetail {
  PriceDetail({
    required this.subtotal,
    required this.discount,
    required this.deliveryFee,
    required this.total,
  });

  final String? subtotal;
  final String? discount;
  final String? deliveryFee;
  final String? total;

  factory PriceDetail.fromJson(Map<String, dynamic> json) {
    return PriceDetail(
      subtotal: json["subtotal"],
      discount: json["discount"],
      deliveryFee: json["delivery_fee"],
      total: json["total"],
    );
  }
}

class OrderStatus {
  OrderStatus({
    required this.isActive,
    required this.title,
    required this.value,
  });

  final bool? isActive;
  final String? title;
  final String? value;

  factory OrderStatus.fromJson(Map<String, dynamic> json) {
    return OrderStatus(
      isActive: json["is_active"],
      title: json["title"],
      value: json["value"],
    );
  }
}
