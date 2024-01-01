import 'package:alpha_work/Utils/appUrls.dart';
import 'package:alpha_work/Utils/shared_pref..dart';
import 'package:alpha_work/View/Dashboard/model/dashboardServiceModel.dart';
import 'package:alpha_work/repository/dashboardRepository.dart';
import 'package:flutter/material.dart';

class DashboardViewModel with ChangeNotifier {
  final _myRepo = DashboardRepository();
  bool isLoading = true;
  late DashData dashData;

  bool get loading => isLoading;
  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  //Function to fetch dashboard data
  Future<void> getDashboardData() async {
    String token = PreferenceUtils.getString(PrefKeys.jwtToken);
    await _myRepo
        .getDashboardDataRequest(api: AppUrl.dashboardData, token: token)
        .then((value) {
      print(value.data!.totalSale);
      dashData = value.data!;
      setLoading(false);
    }).onError((error, stackTrace) => setLoading(false));
  }
}
