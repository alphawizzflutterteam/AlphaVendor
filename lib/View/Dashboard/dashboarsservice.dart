import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Utils/appUrls.dart';

class dashboardserive {
  String url = AppUrl.getSellerDashboard;
  String token = AppUrl.apitoken;
  // String token1 = 'kRqVkZToRSVNOEXuWpgswfMGwaFgw9KqB6k3JrEYYnOn7sXqsx';

  Future getDashboardSellerDetails() async {
    var data = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization": 'Bearer $token',
      },
    );
    print(data.statusCode);
    return jsonDecode(data.body);
  }
}
