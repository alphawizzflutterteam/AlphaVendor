import 'package:alpha_work/Utils/appUrls.dart';
import 'package:alpha_work/Utils/shared_pref..dart';
import 'package:alpha_work/View/Dashboard/Dashboad.dart';
import 'package:alpha_work/View/Dashboard/model/dashboardServiceModel.dart';
import 'package:alpha_work/repository/dashboardRepository.dart';
import 'package:flutter/material.dart';

class DashboardViewModel with ChangeNotifier {
  final _myRepo = DashboardRepository();
  bool isLoading = true;
  late DashData dashData;

  List<ChartData> chartData = [];
  List<ChartData> circleData = [];
  bool get loading => isLoading;
  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  //Function to fetch dashboard data
  Future<void> getDashboardData(String type) async {
    String token = PreferenceUtils.getString(PrefKeys.jwtToken);
    print(token);
    chartData.clear();
    circleData.clear();
    await _myRepo
        .getDashboardDataRequest(
            api: AppUrl.dashboardData + "?type=" + type, token: token)
        .then((value) {
      print(value.data!.totalSale);
      dashData = value.data!;
      for (int i = 0; i < dashData.graphData!.sellerLabel.length; i++) {
        chartData.add(ChartData(dashData.graphData!.sellerLabel[i],
            double.parse(dashData.graphData!.sellerEarn[i])));
      }

      try {
        for (int i = 0;
            i < dashData.categoryProduct!.first.categoryLabel.length;
            i++) {
          circleData.add(ChartData(
              dashData.categoryProduct!.first.categoryLabel[i].toString(),
              double.parse(dashData.categoryProduct!.first.categoryProducts[i])
                  .toDouble()));
        }
      } catch (stacktrace, error) {
        print(stacktrace.toString() + "CIRCLE ERROR");
        print(error.toString() + "CIRCLE ERROR s");
      }

      // print("chart Data ${chartData.toString()}");

      setLoading(false);
    }).onError((error, stackTrace) => setLoading(false));
  }
}
