import 'dart:convert';

import 'package:http/http.dart' as http;

class SignupService {
//Country Derails
  Future GetCountryList() async {
    String url1 =
        'https://alpha-ecom.developmentalphawizz.com/api/v1/countries';

    var data = await http.get(Uri.parse(url1), headers: {});

    return jsonDecode(data.body);
  }

  Future GetState(cId) async {
    String url1 =
        'https://alpha-ecom.developmentalphawizz.com/api/v1/states?country_id=$cId';

    var data = await http.get(Uri.parse(url1), headers: {});

    return jsonDecode(data.body);
  }

  Future GetCity(sId) async {
    String url1 =
        'https://alpha-ecom.developmentalphawizz.com/api/v1/cities?state_id=$sId';

    var data = await http.get(Uri.parse(url1), headers: {});

    // print(data.statusCode);
    // print(data.body);
    return jsonDecode(data.body);
  }
}
