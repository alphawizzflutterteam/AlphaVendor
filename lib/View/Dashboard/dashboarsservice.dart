import 'dart:convert';

import 'package:alpha_work/Utils/shared_pref..dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/appUrls.dart';

class dashboardserive {
  String url = AppUrl.getSellerDashboard;

  // String token1 = 'kRqVkZToRSVNOEXuWpgswfMGwaFgw9KqB6k3JrEYYnOn7sXqsx';

  Future getDashboardSellerDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString(PrefKeys.jwtToken).toString();
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
