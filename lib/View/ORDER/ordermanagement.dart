import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Utils/images.dart';
import 'package:alpha_work/View/ORDER/pendingOrderDetail.dart';
import 'package:alpha_work/View/ORDER/pickupSlot.dart';
import 'package:alpha_work/ViewModel/orderMgmtViewModel.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/comman_header.dart';
import 'package:alpha_work/Widget/appLoader.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:flutter_custom_tab_bar/library.dart';
import 'package:provider/provider.dart';

class OrderManagement extends StatefulWidget {
  const OrderManagement({super.key});

  @override
  State<OrderManagement> createState() => _OrderManagementState();
}

class _OrderManagementState extends State<OrderManagement> {
  late int pageCount;
  final PageController _controller = PageController();
  final CustomTabBarController _tabBarController = CustomTabBarController();

  late OrderManagementViewModel orderProvider;
  @override
  void initState() {
    orderProvider = Provider.of(context, listen: false);
    orderProvider.getOrderList(status: 'pending');
    pageCount = orderProvider.orderStatus.length.toInt();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // orderProvider = Provider.of(context);
    var height = MediaQuery.of(context).size.height;
    var widht = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: orderProvider.isLoading
          ? appLoader()
          : Column(
              children: [
                Container(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.transparent
                      : colors.buttonColor,
                  child: const Stack(
                    children: [
                      ProfileHeader(),
                      InternalDetailPageHeader(
                        text: "Order Management",
                      )
                    ],
                  ),
                ),
                CustomTabBar(
                  tabBarController: _tabBarController,
                  height: 40,
                  itemCount: orderProvider.orderStatus.length,
                  builder: (context, index) => getTabbarChild(
                      context: context,
                      index: index,
                      tabTitle:
                          orderProvider.orderStatus[index].value.toString()),
                  indicator: StandardIndicator(
                    width: 20,
                    height: 2,
                    color: Colors.black,
                  ),
                  pageController: _controller,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 15, bottom: 8),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 45,
                        width: MediaQuery.of(context).size.width * .83,
                        child: TextFormField(
                          // controller: searchcontroller,
                          onChanged: (String? value) {
                            setState(() {
                              // search = value.toString();
                            });
                          },
                          decoration: InputDecoration(
                            filled: true,
                            // fillColor: const Color.fromARGB(255, 233, 233, 253),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 0, color: Colors.grey)),
                            hintText: "Search ",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                            prefixIcon: const Icon(Icons.search),
                            prefixIconColor: Colors.grey,
                          ),
                          style: const TextStyle(),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.filter_list_outlined,
                            color: Colors.black,
                          ))
                    ],
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                      controller: _controller,
                      itemCount: pageCount,
                      onPageChanged: (value) {
                        orderProvider.getOrderList(
                            status: orderProvider.orderStatus[value].title
                                .toString());
                      },
                      itemBuilder: (context, index) {
                        return Consumer<OrderManagementViewModel>(
                            builder: (context, order, _) {
                          return order.orderList.isEmpty
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Image.asset(Images.noOrder,
                                          height: height * .5,
                                          width: widht,
                                          fit: BoxFit.fitWidth),
                                    ),
                                    Text(
                                      "No Order Data Found",
                                      style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w600,
                                        color: colors.lightGrey,
                                      ),
                                    )
                                  ],
                                )
                              : Container(
                                  child: ListView.builder(
                                      itemCount: order.orderList.length,
                                      itemBuilder: (context, indx) {
                                        return OrderListTile(
                                          title: order
                                              .orderList[indx].detail!.name
                                              .toString(),
                                          id: order.orderList[indx].orderId
                                              .toString(),
                                          date: order.orderList[indx].orderDate
                                              .toString(),
                                          price: order
                                              .orderList[indx].orderAmount
                                              .toString(),
                                          isAlpha: order
                                              .orderList[indx].isAlphaDelivery!,
                                        );
                                      }),
                                );
                        });
                      }),
                )
              ],
            ),
    );
  }

  Widget getTabbarChild(
      {required BuildContext context,
      required int index,
      required String tabTitle}) {
    return TabBarItem(
        index: index,
        transform: ScaleTransform(
            maxScale: 1.2,
            transform: ColorsTransform(
              normalColor: Colors.grey,
              highlightColor: Colors.black,
              builder: (context, color) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  alignment: Alignment.center,
                  constraints: const BoxConstraints(minWidth: 70),
                  child: Text(
                    tabTitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: color,
                    ),
                  ),
                );
              },
            )));
  }

  Widget ListDetails() {
    return Container(
      child: const Column(
        children: [Text("")],
      ),
    );
  }
}

class OrderListTile extends StatelessWidget {
  final String title;
  final String id;
  final String date;
  final String price;
  final bool isAlpha;

  const OrderListTile(
      {super.key,
      required this.title,
      required this.id,
      required this.date,
      required this.price,
      required this.isAlpha});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          PageTransition(
            child: PendingOrderDetail(),
            type: PageTransitionType.rightToLeft,
          )),
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFE9E9E9)),
        height: MediaQuery.of(context).size.height * .16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Oats Fitness",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  "Id - OID52466246325",
                  style: TextStyle(
                    fontSize: 14,
                    color: colors.greyText,
                  ),
                ),
                Spacer(),
                Container(
                  height: 30,
                  width: 30,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset(
                    Images.alpha_icon,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            Text(
              "03-Feb-2023",
              style: TextStyle(
                fontSize: 14,
                color: colors.greyText,
              ),
            ),
            Row(
              children: [
                Text(
                  "\$ 120",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: colors.lightBorder,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "CANCEL",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                VerticalDivider(color: Colors.transparent),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PickupSlotScreen(),
                  )),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: colors.buttonColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "SHIP NOW",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
