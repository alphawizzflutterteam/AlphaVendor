class CustomerModel {
  CustomerModel({
    required this.status,
    required this.message,
    required this.data,
    required this.errors,
  });

  final bool? status;
  final String? message;
  final List<CustomerData> data;
  final List<dynamic> errors;

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<CustomerData>.from(
              json["data"]!.map((x) => CustomerData.fromJson(x))),
      errors: json["errors"] == null
          ? []
          : List<dynamic>.from(json["errors"]!.map((x) => x)),
    );
  }
}

class CustomerData {
  CustomerData({
    required this.id,
    required this.fName,
    required this.email,
    required this.phone,
    required this.streetAddress,
    required this.country,
    required this.state,
    required this.city,
    required this.zip,
    required this.image,
  });

  final int? id;
  final String? fName;
  final String? email;
  final String? phone;
  final String? streetAddress;
  final String? country;
  final String? state;
  final String? city;
  final String? zip;
  final String? image;

  factory CustomerData.fromJson(Map<String, dynamic> json) {
    return CustomerData(
      id: json["id"],
      fName: json["f_name"],
      email: json["email"],
      phone: json["phone"],
      streetAddress: json["street_address"],
      country: json["country"],
      state: json["state"],
      city: json["city"],
      zip: json["zip"],
      image: json["image"],
    );
  }
}
