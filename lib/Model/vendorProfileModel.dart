class VendorProfileModel {
  VendorProfileModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final List<VendorData> data;

  factory VendorProfileModel.fromJson(Map<String, dynamic> json) {
    return VendorProfileModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<VendorData>.from(
              json["data"]!.map((x) => VendorData.fromJson(x))),
    );
  }
}

class VendorData {
  VendorData({
    required this.id,
    required this.fName,
    required this.lName,
    required this.phone,
    required this.image,
    required this.email,
    required this.password,
    required this.status,
    required this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
    required this.bankName,
    required this.branch,
    required this.accountNo,
    required this.holderName,
    required this.accountType,
    required this.micrCode,
    required this.bankAddress,
    required this.ifscCode,
    required this.authToken,
    required this.salesCommissionPercentage,
    required this.gst,
    required this.cmFirebaseToken,
    required this.posStatus,
    required this.rating,
    required this.ratingCount,
    required this.shop,
  });

  final int? id;
  final String? fName;
  final String? lName;
  final String? phone;
  final String? image;
  final String? email;
  final String? password;
  final String? status;
  final String? rememberToken;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? bankName;
  final String? branch;
  final String? accountNo;
  final String? holderName;
  final String? accountType;
  final String? micrCode;
  final String? bankAddress;
  final String? ifscCode;
  final String? authToken;
  final String? salesCommissionPercentage;
  final String? gst;
  final String? cmFirebaseToken;
  final int? posStatus;
  final double? rating;
  final int? ratingCount;
  final Shop? shop;

  factory VendorData.fromJson(Map<String, dynamic> json) {
    return VendorData(
      id: json["id"],
      fName: json["f_name"],
      lName: json["l_name"],
      phone: json["phone"],
      image: json["image"],
      email: json["email"],
      password: json["password"],
      status: json["status"],
      rememberToken: json["remember_token"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      bankName: json["bank_name"],
      branch: json["branch"],
      accountNo: json["account_no"],
      holderName: json["holder_name"],
      accountType: json["account_type"],
      micrCode: json["micr_code"],
      bankAddress: json["bank_address"],
      ifscCode: json["ifsc_code"],
      authToken: json["auth_token"],
      salesCommissionPercentage: json["sales_commission_percentage"],
      gst: json["gst"],
      cmFirebaseToken: json["cm_firebase_token"],
      posStatus: json["pos_status"],
      rating: json["rating"],
      ratingCount: json["rating_count"],
      shop: json["shop"] == null ? null : Shop.fromJson(json["shop"]),
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
    required this.email,
    required this.image,
    required this.bottomBanner,
    required this.vacationStartDate,
    required this.vacationEndDate,
    required this.vacationNote,
    required this.vacationStatus,
    required this.temporaryClose,
    required this.createdAt,
    required this.updatedAt,
    required this.banner,
    required this.bussinessType,
    required this.registerationNumber,
    required this.gstIn,
    required this.taxIdentificationNumber,
    required this.websiteLink,
    required this.city,
    required this.state,
    required this.pincode,
    required this.country,
    required this.details,
    required this.socialLink,
    required this.refferral,
    required this.friendsCode,
  });

  final int? id;
  final int? sellerId;
  final String? name;
  final String? address;
  final String? contact;
  final String? email;
  final String? image;
  final String? bottomBanner;
  final String? vacationStartDate;
  final String? vacationEndDate;
  final String? vacationNote;
  final int? vacationStatus;
  final int? temporaryClose;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? banner;
  final String? bussinessType;
  final String? registerationNumber;
  final String? gstIn;
  final String? taxIdentificationNumber;
  final String? websiteLink;
  final String? city;
  final String? state;
  final String? pincode;
  final String? country;
  final String? details;
  final String? socialLink;
  final String? refferral;
  final String? friendsCode;

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      id: json["id"],
      sellerId: json["seller_id"],
      name: json["name"],
      address: json["address"],
      contact: json["contact"],
      email: json["email"],
      image: json["image"],
      bottomBanner: json["bottom_banner"],
      vacationStartDate: json["vacation_start_date"],
      vacationEndDate: json["vacation_end_date"],
      vacationNote: json["vacation_note"],
      vacationStatus: json["vacation_status"],
      temporaryClose: json["temporary_close"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      banner: json["banner"],
      bussinessType: json["bussiness_type"],
      registerationNumber: json["registeration_number"],
      gstIn: json["gst_in"],
      taxIdentificationNumber: json["tax_identification_number"],
      websiteLink: json["website_link"],
      city: json["city"],
      state: json["state"],
      pincode: json["pincode"],
      country: json["country"],
      details: json["details"],
      socialLink: json["social_link"],
      refferral: json["refferral"],
      friendsCode: json["friends_code"],
    );
  }
}
