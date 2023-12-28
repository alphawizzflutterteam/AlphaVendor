class LoginOtpResponseModel {
  LoginOtpResponseModel({
    required this.status,
    required this.message,
    required this.token,
    required this.errors,
    required this.data,
    required this.otp,
  });

  final bool? status;
  final String? message;
  final String? token;
  final List<dynamic> errors;
  final List<dynamic> data;
  final String? otp;

  factory LoginOtpResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginOtpResponseModel(
      status: json["status"],
      message: json["message"],
      token: json["token"],
      errors: json["errors"] == null
          ? []
          : List<dynamic>.from(json["errors"]!.map((x) => x)),
      data: json["data"] == null
          ? []
          : List<dynamic>.from(json["data"]!.map((x) => x)),
      otp: json["otp"],
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
        "errors": errors.map((x) => x).toList(),
        "data": data.map((x) => x).toList(),
        "otp": otp,
      };
}
