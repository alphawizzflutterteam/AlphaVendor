class ProductDetailModel {
  ProductDetailModel({
    required this.status,
    required this.message,
    required this.product,
  });

  final bool? status;
  final String? message;
  final List<Product> product;

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailModel(
      status: json["status"],
      message: json["message"],
      product: json["product"] == null
          ? []
          : List<Product>.from(
              json["product"]!.map((x) => Product.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "product": product.map((x) => x?.toJson()).toList(),
      };
}

class Product {
  Product({
    required this.id,
    required this.addedBy,
    required this.userId,
    required this.name,
    required this.slug,
    required this.productType,
    required this.categoryIds,
    required this.categoryId,
    required this.subCategoryId,
    required this.subSubCategoryId,
    required this.brandId,
    required this.unit,
    required this.minQty,
    required this.refundable,
    required this.digitalProductType,
    required this.digitalFileReady,
    required this.images,
    required this.colorImage,
    required this.thumbnail,
    required this.featured,
    required this.flashDeal,
    required this.videoProvider,
    required this.videoUrl,
    required this.colors,
    required this.variantProduct,
    required this.attributes,
    required this.choiceOptions,
    required this.variation,
    required this.published,
    required this.unitPrice,
    required this.purchasePrice,
    required this.tax,
    required this.taxType,
    required this.taxModel,
    required this.discount,
    required this.discountType,
    required this.currentStock,
    required this.minimumOrderQty,
    required this.details,
    required this.freeShipping,
    required this.attachment,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.featuredStatus,
    required this.metaTitle,
    required this.metaDescription,
    required this.metaImage,
    required this.requestStatus,
    required this.deniedNote,
    required this.shippingCost,
    required this.multiplyQty,
    required this.tempShippingCost,
    required this.isShippingCostUpdated,
    required this.code,
    required this.shortDescription,
    required this.warranty,
    required this.specification,
    required this.shop,
    required this.colorsFormatted,
    required this.weight,
    required this.specialPrice,
    required this.taxAmount,
    required this.reviewsCount,
    required this.rating,
    required this.tags,
    required this.translations,
    required this.shareLink,
    required this.reviews,
    required this.isFavorite,
    required this.isCart,
    required this.cartId,
    required this.manufacturingDate,
    required this.madeIn,
    required this.useCoinsWithAmount,
    required this.amountAfterCoinUse,
  });

  final int? id;
  final String? addedBy;
  final int? userId;
  final String? name;
  final String? slug;
  final String? productType;
  final List<CategoryId> categoryIds;
  final String? categoryId;
  final String? subCategoryId;
  final String? subSubCategoryId;
  final int? brandId;
  final String? unit;
  final int? minQty;
  final int? refundable;
  final String? digitalProductType;
  final String? digitalFileReady;
  final List<String> images;
  final List<ColorImage> colorImage;
  final String? thumbnail;
  final int? featured;
  final int? flashDeal;
  final String? videoProvider;
  final String? videoUrl;
  final List<String> colors;
  final int? variantProduct;
  final List<int> attributes;
  final List<ChoiceOption> choiceOptions;
  final List<Variation> variation;
  final int? published;
  final String? unitPrice;
  final String? purchasePrice;
  final int? tax;
  final String? taxType;
  final String? taxModel;
  final int? discount;
  final String? discountType;
  final int? currentStock;
  final int? minimumOrderQty;
  final String? details;
  final int? freeShipping;
  final String? attachment;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? status;
  final int? featuredStatus;
  final String? metaTitle;
  final String? metaDescription;
  final String? metaImage;
  final int? requestStatus;
  final String? deniedNote;
  final int? shippingCost;
  final int? multiplyQty;
  final int? tempShippingCost;
  final int? isShippingCostUpdated;
  final String? code;
  final String? shortDescription;
  final String? warranty;
  final String? specification;
  final Shop? shop;
  final List<ColorsFormatted> colorsFormatted;
  final String? weight;
  final String? specialPrice;
  final String? taxAmount;
  final int? reviewsCount;
  final List<dynamic> rating;
  final List<dynamic> tags;
  final List<dynamic> translations;
  final String? shareLink;
  final List<dynamic> reviews;
  final bool? isFavorite;
  final bool? isCart;
  final int? cartId;
  final String? manufacturingDate;
  final String? madeIn;
  final String? useCoinsWithAmount;
  final String? amountAfterCoinUse;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      addedBy: json["added_by"],
      userId: json["user_id"],
      name: json["name"],
      slug: json["slug"],
      productType: json["product_type"],
      categoryIds: json["category_ids"] == null
          ? []
          : List<CategoryId>.from(
              json["category_ids"]!.map((x) => CategoryId.fromJson(x))),
      categoryId: json["category_id"],
      subCategoryId: json["sub_category_id"],
      subSubCategoryId: json["sub_sub_category_id"],
      brandId: json["brand_id"],
      unit: json["unit"],
      minQty: json["min_qty"],
      refundable: json["refundable"],
      digitalProductType: json["digital_product_type"],
      digitalFileReady: json["digital_file_ready"],
      images: json["images"] == null
          ? []
          : List<String>.from(json["images"]!.map((x) => x)),
      colorImage: json["color_image"] == null
          ? []
          : List<ColorImage>.from(
              json["color_image"]!.map((x) => ColorImage.fromJson(x))),
      thumbnail: json["thumbnail"],
      featured: json["featured"],
      flashDeal: json["flash_deal"],
      videoProvider: json["video_provider"],
      videoUrl: json["video_url"],
      colors: json["colors"] == null
          ? []
          : List<String>.from(json["colors"]!.map((x) => x)),
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
      published: json["published"],
      unitPrice: json["unit_price"],
      purchasePrice: json["purchase_price"],
      tax: json["tax"],
      taxType: json["tax_type"],
      taxModel: json["tax_model"],
      discount: json["discount"],
      discountType: json["discount_type"],
      currentStock: json["current_stock"],
      minimumOrderQty: json["minimum_order_qty"],
      details: json["details"],
      freeShipping: json["free_shipping"],
      attachment: json["attachment"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      status: json["status"],
      featuredStatus: json["featured_status"],
      metaTitle: json["meta_title"],
      metaDescription: json["meta_description"],
      metaImage: json["meta_image"],
      requestStatus: json["request_status"],
      deniedNote: json["denied_note"],
      shippingCost: json["shipping_cost"],
      multiplyQty: json["multiply_qty"],
      tempShippingCost: json["temp_shipping_cost"],
      isShippingCostUpdated: json["is_shipping_cost_updated"],
      code: json["code"],
      shortDescription: json["short_description"],
      warranty: json["warranty"],
      specification: json["specification"],
      shop: json["shop"] == null ? null : Shop.fromJson(json["shop"]),
      colorsFormatted: json["colors_formatted"] == null
          ? []
          : List<ColorsFormatted>.from(json["colors_formatted"]!
              .map((x) => ColorsFormatted.fromJson(x))),
      weight: json["weight"],
      specialPrice: json["special_price"],
      taxAmount: json["tax_amount"],
      reviewsCount: json["reviews_count"],
      rating: json["rating"] == null
          ? []
          : List<dynamic>.from(json["rating"]!.map((x) => x)),
      tags: json["tags"] == null
          ? []
          : List<dynamic>.from(json["tags"]!.map((x) => x)),
      translations: json["translations"] == null
          ? []
          : List<dynamic>.from(json["translations"]!.map((x) => x)),
      shareLink: json["share_link"],
      reviews: json["reviews"] == null
          ? []
          : List<dynamic>.from(json["reviews"]!.map((x) => x)),
      isFavorite: json["is_favorite"],
      isCart: json["is_cart"],
      cartId: json["cart_id"],
      manufacturingDate: json["manufacturing_date"],
      madeIn: json["made_in"],
      useCoinsWithAmount: json["use_coins_with_amount"],
      amountAfterCoinUse: json["amount_after_coin_use"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "added_by": addedBy,
        "user_id": userId,
        "name": name,
        "slug": slug,
        "product_type": productType,
        "category_ids": categoryIds.map((x) => x?.toJson()).toList(),
        "category_id": categoryId,
        "sub_category_id": subCategoryId,
        "sub_sub_category_id": subSubCategoryId,
        "brand_id": brandId,
        "unit": unit,
        "min_qty": minQty,
        "refundable": refundable,
        "digital_product_type": digitalProductType,
        "digital_file_ready": digitalFileReady,
        "images": images.map((x) => x).toList(),
        "color_image": colorImage.map((x) => x?.toJson()).toList(),
        "thumbnail": thumbnail,
        "featured": featured,
        "flash_deal": flashDeal,
        "video_provider": videoProvider,
        "video_url": videoUrl,
        "colors": colors.map((x) => x).toList(),
        "variant_product": variantProduct,
        "attributes": attributes.map((x) => x).toList(),
        "choice_options": choiceOptions.map((x) => x?.toJson()).toList(),
        "variation": variation.map((x) => x?.toJson()).toList(),
        "published": published,
        "unit_price": unitPrice,
        "purchase_price": purchasePrice,
        "tax": tax,
        "tax_type": taxType,
        "tax_model": taxModel,
        "discount": discount,
        "discount_type": discountType,
        "current_stock": currentStock,
        "minimum_order_qty": minimumOrderQty,
        "details": details,
        "free_shipping": freeShipping,
        "attachment": attachment,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "status": status,
        "featured_status": featuredStatus,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_image": metaImage,
        "request_status": requestStatus,
        "denied_note": deniedNote,
        "shipping_cost": shippingCost,
        "multiply_qty": multiplyQty,
        "temp_shipping_cost": tempShippingCost,
        "is_shipping_cost_updated": isShippingCostUpdated,
        "code": code,
        "short_description": shortDescription,
        "warranty": warranty,
        "specification": specification,
        "shop": shop?.toJson(),
        "colors_formatted": colorsFormatted.map((x) => x?.toJson()).toList(),
        "weight": weight,
        "special_price": specialPrice,
        "tax_amount": taxAmount,
        "reviews_count": reviewsCount,
        "rating": rating.map((x) => x).toList(),
        "tags": tags.map((x) => x).toList(),
        "translations": translations.map((x) => x).toList(),
        "share_link": shareLink,
        "reviews": reviews.map((x) => x).toList(),
        "is_favorite": isFavorite,
        "is_cart": isCart,
        "cart_id": cartId,
        "manufacturing_date": manufacturingDate,
        "made_in": madeIn,
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
