import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Utils/images.dart';
import 'package:alpha_work/View/ORDER/model/orderModel.dart';
import 'package:alpha_work/View/ORDER/pendingOrderDetail.dart';
import 'package:alpha_work/View/ORDER/pickupSlot.dart';
import 'package:alpha_work/View/Product/model/productListModel.dart';
import 'package:alpha_work/ViewModel/orderMgmtViewModel.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/comman_header.dart';
import 'package:alpha_work/Widget/appLoader.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:page_transition/page_transition.dart';

import 'package:flutter_custom_tab_bar/library.dart';
import 'package:provider/provider.dart';
import 'package:searchable_listview/searchable_listview.dart';

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
  getData() async {
    await orderProvider.getOrderList(status: '');
    await orderProvider.getOrderList(
        status: orderProvider.orderStatus[0].value.toString());
    pageCount = orderProvider.orderStatus.length.toInt();
  }

  @override
  void initState() {
    orderProvider =
        Provider.of<OrderManagementViewModel>(context, listen: false);
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var widht = MediaQuery.of(context).size.width;
    orderProvider = Provider.of<OrderManagementViewModel>(context);
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
                  direction: Axis.horizontal,
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
                Expanded(
                  child: PageView.builder(
                      controller: _controller,
                      scrollDirection: Axis.horizontal,
                      itemCount: pageCount,
                      onPageChanged: (value) {
                        orderProvider.getOrderList(
                            status: orderProvider.orderStatus[value].title
                                .toString());
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Consumer<OrderManagementViewModel>(
                              builder: (context, order, _) {
                            print(
                                "Order list length :${order.orderList.length} page index: ${index}");

                            return order.isLoading
                                ? appLoader()
                                : order.orderList.isEmpty
                                    ? NoOrderFound(height: 100)
                                    : SearchableList(
                                        autoFocusOnSearch: false,
                                        filter: (query) => order.orderList
                                            .where((ele) => ele.orderId
                                                .toString()
                                                .contains(query))
                                            .toList(),
                                        inputDecoration:
                                            (const InputDecoration())
                                                .applyDefaults(Theme.of(context)
                                                    .inputDecorationTheme)
                                                .copyWith(
                                                  hintText: "Search by OrderID",
                                                  hintStyle: TextStyle(
                                                      color: colors.greyText,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                        initialList: order.orderList,
                                        emptyWidget:
                                            NoOrderFound(height: height),
                                        builder: (context, indx, item) {
                                          return OrderListTile(
                                            type: order.orderStatus[index].value
                                                .toString(),
                                            order: order.orderList[indx],
                                            title: order
                                                .orderList[indx].detail!.name
                                                .toString(),
                                            id: order.orderList[indx].orderId
                                                .toString(),
                                            date: order
                                                .orderList[indx].orderDate
                                                .toString(),
                                            price: order
                                                .orderList[indx].orderAmount
                                                .toString(),
                                            isAlpha: order.orderList[indx]
                                                .isAlphaDelivery!,
                                          );
                                        });
                          }),
                        );
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
        ),
      ),
    );
  }
}

class NoOrderFound extends StatelessWidget {
  const NoOrderFound({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(Images.noOrder,
              height: 150, width: 150, fit: BoxFit.fitWidth),
        ),
        Text(
          "No Order Data Found",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: colors.buttonColor,
          ),
        )
      ],
    );
  }
}

class OrderListTile extends StatelessWidget {
  final String title;
  final String id;
  final String date;
  final String price;
  final String type;
  final bool isAlpha;
  final OrderData order;

  const OrderListTile({
    super.key,
    required this.title,
    required this.id,
    required this.date,
    required this.price,
    required this.isAlpha,
    required this.order,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(order.detail!.id);
        Navigator.push(
            context,
            PageTransition(
              child: PendingOrderDetail(order: order, orderType: type),
              type: PageTransitionType.rightToLeft,
            ));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFE9E9E9)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  "Id - $id",
                  style: TextStyle(
                    fontSize: 14,
                    color: colors.greyText,
                  ),
                ),
                Spacer(),
                isAlpha
                    ? Container(
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
                      )
                    : Container(),
              ],
            ),
            Text(
              date,
              style: TextStyle(
                fontSize: 14,
                color: colors.greyText,
              ),
            ),
            Row(
              children: [
                Text(
                  price,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Montreal',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                type == 'Pending'
                    ? pendOrderWidget(context: context, orderId: id)
                    : Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: getTextColor(type).withOpacity(0.2),
                          border:
                              Border.all(width: 1, color: getTextColor(type)),
                        ),
                        child: Text(
                          type,
                          style: TextStyle(color: getTextColor(type)),
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

Color getTextColor(String status) {
  switch (status.toLowerCase()) {
    case 'confirmed':
      return Colors.blue;
    case 'processing':
      return colors.deliveredLight;
    case 'cancelled':
      return Colors.red;
    case 'delivered':
      return Colors.green;
    case 'pending':
      return Colors.orange;

    default:
      return Colors.black;
  }
}

pendOrderWidget<Widget>(
    {required BuildContext context, required String orderId}) {
  return Row(
    children: [
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
          builder: (context) => PickupSlotScreen(orderID: orderId),
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
  );
}
