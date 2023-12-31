import 'package:alpha_work/Utils/images.dart';
import 'package:alpha_work/View/Product/productManagement.dart';
import 'package:alpha_work/View/Profile/profile/Profile.dart';
import 'package:alpha_work/View/Profile/settings/settings.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../Router/router.dart';
import '../../Utils/color.dart';
import '../../Widget/CommonTextWidget/commontext.dart';
import '../ORDER/ordermanagement.dart';
import 'dashboarsservice.dart';

class DashboardScreen1 extends StatefulWidget {
  const DashboardScreen1({super.key});

  @override
  State<DashboardScreen1> createState() => _DashboardScreen1State();
}

class _DashboardScreen1State extends State<DashboardScreen1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tooltipBehavior = TooltipBehavior(enable: true);
    _tooltipBehavior1 = TooltipBehavior(enable: true);

    getSellerDetails();
    //  _tabController =  TabController(length: 2, vsync: true);
  }

  getSellerDetails() {
    // final service = dashboardserive();
    // service.getDashboardSellerDetails().then((value) {
    //   // print("object");
    //   print(value);
    //   setState(() {
    //     _sellerdata.add(value['data']);
    //     print(_sellerdata);
    //   });
    // });
  }

  late TooltipBehavior _tooltipBehavior;
  late TooltipBehavior _tooltipBehavior1;
  // late TabController _tabController;

  List items = [
    {'id': 1, 'name': 'Total Sale', 'value': '234'},
    {'id': 2, 'name': 'Total Order', 'value': '123'},
    {'id': 3, 'name': 'Stock Management', 'value': '300'},
    {'id': 4, 'name': 'Customer', 'value': '500'},
    {'id': 5, 'name': 'Total Deleviry', 'value': '100'},
    {'id': 6, 'name': 'Reating Review', 'value': '4.5'},
  ];
  final List<ChartData> chartData = [
    ChartData('David', 25),
    ChartData('Steve', 38),
    ChartData('Jack', 34),
    ChartData('Others', 52)
  ];

  final navigator = NavigateToRouter();
  final _sellerdata = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                      // color: Colors.green,
                      image: DecorationImage(
                          image: AssetImage("assets/images/success.png"),
                          fit: BoxFit.cover)),
                  //BoxDecoration
                  child: ListTile(
                    leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(Images.driver_profile)),
                    title: Text(
                      "Hritik",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          )),
                      child: Text(
                        "View Profile",
                        style: TextStyle(
                            color: Color.fromARGB(255, 127, 213, 233),
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ) //UserAccountDrawerHeader
                  ),

              //DrawerHeader
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "OverView",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                selected: true,
                selectedColor: colors.homeBGGradient1,
                leading: const Icon(Icons.dashboard_sharp),
                title: const Text(' Dashboard '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_bag_rounded),
                title: const DrawerText(text: 'Order Managemnt', ''),
                onTap: () {
                  navigator.navigatetonextScreen(context);

                  // Navigator.push(
                  //     context,
                  //     PageTransition(
                  //         type: PageTransitionType.rightToLeft,
                  //         child: OrderManagement()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.workspace_premium),
                title: const DrawerText(text: 'Product Management', ''),
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const ProductManagementScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_outline_outlined),
                title: const DrawerText(text: 'Customer', ''),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.analytics_outlined),
                title: const DrawerText(text: 'Analytics and Reports', ''),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.wallet_sharp),
                title: const DrawerText(text: 'Wallet', ''),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const DrawerText(text: 'Settings', ''),
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const ProfileSettingScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.payment),
                title: const DrawerText(text: 'Payment', ''),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.storefront_outlined),
                title: const DrawerText(text: 'Store Setting', ''),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        // appBar: AppBar(
        //   flexibleSpace: Container(
        //     decoration: const BoxDecoration(
        //         image: DecorationImage(
        //             image: AssetImage('assets/images/success.png'),
        //             fit: BoxFit.fill)),
        //   ),
        //   title: const Text("Seller Dashboard"),
        // ),
        backgroundColor: Colors.blue[50],
        body: _sellerdata.isNotEmpty
            ? const Center(child: CircularProgressIndicator.adaptive())
            : Container(
                child: SingleChildScrollView(
                  child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 300,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: AssetImage("assets/images/success.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Column(
                            children: [
                              AppBar(
                                centerTitle: true,
                                leading: Builder(
                                  builder: (BuildContext context) {
                                    return IconButton(
                                      icon: Image.asset(
                                          Images.hamburgerMenuIcon,
                                          height: 25),
                                      onPressed: () {
                                        Scaffold.of(context).openDrawer();
                                      },
                                      tooltip: MaterialLocalizations.of(context)
                                          .openAppDrawerTooltip,
                                    );
                                  },
                                ),
                                backgroundColor: Colors.transparent,
                                // flexibleSpace: Container(
                                //   decoration: const BoxDecoration(
                                //       image: DecorationImage(
                                //           image: AssetImage('assets/images/success.png'),
                                //           fit: BoxFit.fill)),
                                // ),
                                title: const Text(
                                  "Seller Dashboard",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Column(
                                    children: [
                                      ListTile(
                                        title: Text("Total Sale"),
                                        subtitle: Text('100'),
                                        trailing: Text("4.5"),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      IntrinsicHeight(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              children: [
                                                // Text("Sold Out"),
                                                Text16(
                                                  text: 'Sold out',
                                                ),
                                                Text("452")
                                              ],
                                            ),
                                            VerticalDivider(
                                              color: Colors.grey,
                                              thickness: 1,
                                            ),
                                            Column(
                                              children: [
                                                Text16(
                                                  text: 'Total Product',
                                                ),
                                                Text("123")
                                              ],
                                            ),
                                            VerticalDivider(
                                              color: Colors.grey,
                                              thickness: 1,
                                            ),
                                            Column(
                                              children: [
                                                Text16(
                                                  text: 'Total Order',
                                                ),
                                                Text("987")
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // number of items in each row
                              mainAxisSpacing: 8.0, // spacing between rows
                              crossAxisSpacing: 6.0, // spacing between columns
                            ),
                            padding: const EdgeInsets.all(
                                2.0), // padding around the grid
                            itemCount: items.length, // total number of items
                            itemBuilder: (context, index) {
                              return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ), // color of grid items
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                              color: index == 0
                                                  ? const Color.fromARGB(
                                                      255, 255, 248, 236)
                                                  : index == 1
                                                      ? const Color.fromARGB(
                                                          255, 231, 190, 222)
                                                      : index == 2
                                                          ? const Color.fromARGB(
                                                              255, 222, 191, 228)
                                                          : index == 3
                                                              ? const Color.fromARGB(
                                                                  255,
                                                                  181,
                                                                  216,
                                                                  244)
                                                              : index == 4
                                                                  ? const Color
                                                                      .fromARGB(
                                                                      255,
                                                                      191,
                                                                      224,
                                                                      252)
                                                                  : index == 5
                                                                      ? const Color
                                                                          .fromARGB(
                                                                          255,
                                                                          254,
                                                                          251,
                                                                          228)
                                                                      : Colors
                                                                          .white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Center(
                                              child: Icon(
                                            Icons.shopify_rounded,
                                            color: index == 0
                                                ? const Color.fromARGB(
                                                    255, 187, 134, 42)
                                                : index == 1
                                                    ? const Color.fromARGB(
                                                        255, 147, 47, 165)
                                                    : index == 2
                                                        ? Colors.purple
                                                        : index == 3
                                                            ? Colors.blue
                                                            : index == 4
                                                                ? const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    12,
                                                                    80,
                                                                    135)
                                                                : index == 5
                                                                    ? Colors
                                                                        .yellow
                                                                    : Colors
                                                                        .white,
                                            size: 50,
                                          )),
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Text('${items[index]['name']}'),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${items[index]['value']}',
                                          style: const TextStyle(fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ));
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.white,
                          height: 300,
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
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Categories Wise Product Count',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Container(
                                  child: SfCircularChart(
                                      legend: const Legend(
                                          iconWidth: 20,
                                          width: '100',
                                          isVisible: true),
                                      tooltipBehavior: _tooltipBehavior1,
                                      series: <CircularSeries>[
                                    // Render pie chart

                                    PieSeries<ChartData, String>(
                                        dataSource: [
                                          // Bind data source
                                          ChartData('Product1', 35),
                                          ChartData('Product2', 28),
                                          ChartData('Product3', 34),
                                          ChartData('Product4', 32),
                                          ChartData('Product5', 40)
                                        ],
                                        xValueMapper: (ChartData data, _) =>
                                            data.x,
                                        yValueMapper: (ChartData data, _) =>
                                            data.y,
                                        dataLabelSettings:
                                            const DataLabelSettings(
                                                isVisible: true)),
                                  ])),
                            ],
                          ),
                        ),
                      ]),
                ),
              ));
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
