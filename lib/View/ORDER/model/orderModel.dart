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

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.map((x) => x?.toJson()).toList(),
        "order_status": orderStatus.map((x) => x?.toJson()).toList(),
      };
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

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "order_status": orderStatus,
        "order_date": orderDate,
        "order_amount": orderAmount,
        "is_alpha_delivery": isAlphaDelivery,
        "shipping_address_data": shippingAddressData?.toJson(),
        "billing_address_data": billingAddressData?.toJson(),
        "detail": detail?.toJson(),
        "price_detail": priceDetail?.toJson(),
        "customer": customer,
      };
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

  final int? id;
  final int? customerId;
  final String? contactPersonName;
  final String? addressType;
  final String? address;
  final String? address1;
  final String? city;
  final String? zip;
  final String? phone;
  final dynamic altPhone;
  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic state;
  final String? country;
  final String? latitude;
  final String? longitude;
  final int? isBilling;

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

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "contact_person_name": contactPersonName,
        "address_type": addressType,
        "address": address,
        "address1": address1,
        "city": city,
        "zip": zip,
        "phone": phone,
        "alt_phone": altPhone,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "state": state,
        "country": country,
        "latitude": latitude,
        "longitude": longitude,
        "is_billing": isBilling,
      };
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
  final List<ColorImage> colorImage;
  final String? thumbnail;
  final int? brandId;
  final String? unit;
  final int? minQty;
  final int? featured;
  final String? refundable;
  final int? variantProduct;
  final List<int> attributes;
  final List<ChoiceOption> choiceOptions;
  final List<Variation> variation;
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
  final String? createdAt;
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
  final List<ColorsFormatted> colorsFormatted;
  final bool? isFavorite;
  final bool? isCart;
  final int? cartId;
  final String? manufacturingDate;
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
          : List<ColorImage>.from(
              json["color_image"]!.map((x) => ColorImage.fromJson(x))),
      thumbnail: json["thumbnail"],
      brandId: json["brand_id"],
      unit: json["unit"],
      minQty: json["min_qty"],
      featured: json["featured"],
      refundable: json["refundable"],
      variantProduct: json["variant_product"],
      attributes: json["attributes"] == null
          ? []
          : List<int>.from(json["attributes"]!.map((x) => x)),
      choiceOptions: json["choice_options"] == null
          ? []
          : List<ChoiceOption>.from(
              json["choice_options"]!.map((x) => ChoiceOption.fromJson(x))),
      variation: json["variation"] == null
          ? []
          : List<Variation>.from(
              json["variation"]!.map((x) => Variation.fromJson(x))),
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
      createdAt: json["created_at"],
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
          : List<ColorsFormatted>.from(json["colors_formatted"]!
              .map((x) => ColorsFormatted.fromJson(x))),
      isFavorite: json["is_favorite"],
      isCart: json["is_cart"],
      cartId: json["cart_id"],
      manufacturingDate: json["manufacturing_date"],
      madeIn: json["made_in"],
      warranty: json["warranty"],
      useCoinsWithAmount: json["use_coins_with_amount"],
      amountAfterCoinUse: json["amount_after_coin_use"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_ids": categoryIds.map((x) => x?.toJson()).toList(),
        "user_id": userId,
        "shop": shop?.toJson(),
        "name": name,
        "slug": slug,
        "images": images.map((x) => x).toList(),
        "color_image": colorImage.map((x) => x?.toJson()).toList(),
        "thumbnail": thumbnail,
        "brand_id": brandId,
        "unit": unit,
        "min_qty": minQty,
        "featured": featured,
        "refundable": refundable,
        "variant_product": variantProduct,
        "attributes": attributes.map((x) => x).toList(),
        "choice_options": choiceOptions.map((x) => x?.toJson()).toList(),
        "variation": variation.map((x) => x?.toJson()).toList(),
        "weight": weight,
        "published": published,
        "unit_price": unitPrice,
        "special_price": specialPrice,
        "purchase_price": purchasePrice,
        "tax": tax,
        "tax_type": taxType,
        "tax_model": taxModel,
        "tax_amount": taxAmount,
        "discount": discount,
        "discount_type": discountType,
        "current_stock": currentStock,
        "minimum_order_qty": minimumOrderQty,
        "free_shipping": freeShipping,
        "created_at": createdAt,
        "updated_at": updatedAt?.toIso8601String(),
        "status": status,
        "featured_status": featuredStatus,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_image": metaImage,
        "request_status": requestStatus,
        "shipping_cost": shippingCost,
        "multiply_qty": multiplyQty,
        "code": code,
        "reviews_count": reviewsCount,
        "rating": rating.map((x) => x?.toJson()).toList(),
        "tags": tags.map((x) => x).toList(),
        "translations": translations.map((x) => x).toList(),
        "share_link": shareLink,
        "reviews": reviews.map((x) => x?.toJson()).toList(),
        "colors_formatted": colorsFormatted.map((x) => x?.toJson()).toList(),
        "is_favorite": isFavorite,
        "is_cart": isCart,
        "cart_id": cartId,
        "manufacturing_date": manufacturingDate,
        "made_in": madeIn,
        "warranty": warranty,
        "use_coins_with_amount": useCoinsWithAmount,
        "amount_after_coin_use": amountAfterCoinUse,
      };
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "position": position,
      };
}

class ChoiceOption {
  ChoiceOption({
    required this.name,
    required this.title,
    required this.options,
  });

  final String? name;
  final String? title;
  final List<String> options;

  factory ChoiceOption.fromJson(Map<String, dynamic> json) {
    return ChoiceOption(
      name: json["name"],
      title: json["title"],
      options: json["options"] == null
          ? []
          : List<String>.from(json["options"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "title": title,
        "options": options.map((x) => x).toList(),
      };
}

class ColorImage {
  ColorImage({
    required this.color,
    required this.imageName,
  });

  final String? color;
  final String? imageName;

  factory ColorImage.fromJson(Map<String, dynamic> json) {
    return ColorImage(
      color: json["color"],
      imageName: json["image_name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "color": color,
        "image_name": imageName,
      };
}

class ColorsFormatted {
  ColorsFormatted({
    required this.name,
    required this.code,
  });

  final String? name;
  final String? code;

  factory ColorsFormatted.fromJson(Map<String, dynamic> json) {
    return ColorsFormatted(
      name: json["name"],
      code: json["code"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
      };
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

  Map<String, dynamic> toJson() => {
        "average": average,
        "product_id": productId,
      };
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
  final List<String> attachment;
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
          : List<String>.from(json["attachment"]!.map((x) => x)),
      rating: json["rating"],
      status: json["status"],
      isSaved: json["is_saved"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      customer:
          json["customer"] == null ? null : Customer.fromJson(json["customer"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "customer_id": customerId,
        "delivery_man_id": deliveryManId,
        "order_id": orderId,
        "comment": comment,
        "attachment": attachment.map((x) => x).toList(),
        "rating": rating,
        "status": status,
        "is_saved": isSaved,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "customer": customer?.toJson(),
      };
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "seller_id": sellerId,
        "name": name,
        "address": address,
        "contact": contact,
        "image": image,
        "bottom_banner": bottomBanner,
        "vacation_start_date": vacationStartDate,
        "vacation_end_date": vacationEndDate,
        "vacation_note": vacationNote,
        "vacation_status": vacationStatus,
        "temporary_close": temporaryClose,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "rating": rating,
        "followers": followers,
        "is_verified": isVerified,
        "is_following": isFollowing,
        "banner": banner,
      };
}

class Variation {
  Variation({
    required this.type,
    required this.price,
    required this.sku,
    required this.qty,
  });

  final String? type;
  final String? price;
  final String? sku;
  final int? qty;

  factory Variation.fromJson(Map<String, dynamic> json) {
    return Variation(
      type: json["type"],
      price: json["price"],
      sku: json["sku"],
      qty: json["qty"],
    );
  }

  Map<String, dynamic> toJson() => {
        "type": type,
        "price": price,
        "sku": sku,
        "qty": qty,
      };
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

  Map<String, dynamic> toJson() => {
        "subtotal": subtotal,
        "discount": discount,
        "delivery_fee": deliveryFee,
        "total": total,
      };
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

  Map<String, dynamic> toJson() => {
        "is_active": isActive,
        "title": title,
        "value": value,
      };
}
