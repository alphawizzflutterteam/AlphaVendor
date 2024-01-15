import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/View/Product/model/productListModel.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:alpha_work/Widget/dateFormatter.dart';
import 'package:alpha_work/Widget/errorImage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class UpdateStockScreen extends StatelessWidget {
  UpdateStockScreen({super.key, required this.Pdata});
  final ProductData Pdata;
  final List<ChartData> chartData = [
    ChartData('David', 25),
    ChartData('Steve', 38),
    ChartData('Jack', 34),
    ChartData('Others', 52)
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommanAppbar(appbarTitle: "Update Stock"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: height * .1,
                    width: height * .1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        Pdata.thumbnail.toString(),
                        fit: BoxFit.cover,
                        errorBuilder: (context, url, error) =>
                            ErrorImageWidget(height: null),
                      ),
                    ),
                  ),
                  VerticalDivider(color: Colors.transparent, width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AutoSizeText(
                        Pdata.name.toString(),
                        maxLines: 1,
                        maxFontSize: 18,
                        minFontSize: 16,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(color: Colors.transparent, height: 4),
                      RichText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: Pdata.specialPrice,
                                style: TextStyle(
                                  color: colors.buttonColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                            TextSpan(text: " "),
                            TextSpan(
                              text: Pdata.unitPrice.toString(),
                              style: TextStyle(
                                color: colors.greyText,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SKU ID",
                        style: TextStyle(color: colors.greyText),
                      ),
                      Text(Pdata.slug.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                      Text(
                        "Reorder Point",
                        style: TextStyle(color: colors.greyText),
                      ),
                      Text(Pdata.minimumOrderQty.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Current Stock",
                        style: TextStyle(color: colors.greyText),
                      ),
                      Text(Pdata.currentStock.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold)),
                      Text(
                        "Last Restock Date",
                        style: TextStyle(color: colors.greyText),
                      ),
                      Text(
                          CustomDateFormat.formatDateOnly(
                              Pdata.updatedAt.toString()),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
            Divider(color: colors.lightGrey),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("Add Stock",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextFormField(
                decoration: InputDecoration()
                    .applyDefaults(Theme.of(context).inputDecorationTheme)
                    .copyWith(hintText: "Enter Quantity"),
              ),
            ),
            Divider(color: colors.lightGrey),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Historical Sales Data",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ),
            Container(
              color: Colors.blue.shade50,
              height: height * .4,
              child: ContainedTabBarView(
                tabs: const [
                  Text('Daily'),
                  Text('Weakly'),
                  Text('Montly'),
                ],
                tabBarProperties: TabBarProperties(
                  background: Container(
                      decoration: const BoxDecoration(
                    boxShadow: [],
                  )),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 15.0,
                  ),
                  indicator: ContainerTabIndicator(
                    width: 100,
                    radius: BorderRadius.circular(4.0),
                    color: const Color.fromARGB(255, 71, 168, 177),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey[400],
                ),
                views: [
                  _Views(),
                  _Views(),
                  _Views(),
                ],
                onChange: (index) {},
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        padding: const EdgeInsets.all(8),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap:()=> Navigator.pop(context),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1.5, color: colors.lightGrey)),
                child: Text("CANCEL",style: TextStyle(fontWeight: FontWeight.w600),),
                ),
              ),
            ),
            VerticalDivider(),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  color: colors.buttonColor,
                  ),
                child: Text("ADD",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _Views() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              series: <CartesianSeries>[
            LineSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                // Renders the marker
                markerSettings: const MarkerSettings(isVisible: true))
          ])),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
