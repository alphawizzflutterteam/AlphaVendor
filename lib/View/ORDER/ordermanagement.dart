import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Utils/images.dart';
import 'package:alpha_work/Utils/utils.dart';
import 'package:alpha_work/View/ORDER/model/orderModel.dart';
import 'package:alpha_work/View/ORDER/pendingOrderDetail.dart';
import 'package:alpha_work/View/ORDER/pickupSlot.dart';
import 'package:alpha_work/ViewModel/orderMgmtViewModel.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/comman_header.dart';
import 'package:alpha_work/Widget/Placeholders/NoOrder.dart';
import 'package:alpha_work/Widget/Placeholders/NoSearch.dart';
import 'package:alpha_work/Widget/appLoader.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
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
                                        textInputType: TextInputType.number,
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
                                        emptyWidget: NoSearch(),
                                        builder: (context, indx, item) {
                                          return OrderListTile(
                                            orderPro: orderProvider,
                                            type: order.orderStatus[index].value
                                                .toString(),
                                            order: item,
                                            title: item.detail!.name.toString(),
                                            id: item.orderId.toString(),
                                            date: item.orderDate.toString(),
                                            price: item.orderAmount.toString(),
                                            isAlpha: item.isAlphaDelivery!,
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

class OrderListTile extends StatelessWidget {
  final String title;
  final String id;
  final String date;
  final String price;
  final String type;
  final bool isAlpha;
  final OrderData order;
  final OrderManagementViewModel orderPro;

  const OrderListTile({
    super.key,
    required this.title,
    required this.id,
    required this.date,
    required this.price,
    required this.isAlpha,
    required this.order,
    required this.type,
    required this.orderPro,
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
        margin: const EdgeInsets.only(bottom: 10),
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
                AutoSizeText(
                  price,
                  maxLines: 1,
                  maxFontSize: 24,
                  minFontSize: 16,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Montreal',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                type == 'Pending'
                    ? PendingOrderListTile(orderId: id, orderProvider: orderPro)
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

class PendingOrderListTile extends StatelessWidget {
  const PendingOrderListTile(
      {super.key, required this.orderId, required this.orderProvider});
  final String orderId;
  final OrderManagementViewModel orderProvider;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () => showDialog(
            context: context,
            builder: (context) => Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                // height: height * .4,
                // width: width * .75,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Images.order,
                        height: (MediaQuery.of(context).size.height /
                                MediaQuery.of(context).size.width) *
                            30,
                        color: Colors.red,
                      ),
                      Text(
                        'Do you want to cancel this order.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        'Cancel This Order',
                        style: TextStyle(
                          color: colors.greyText,
                        ),
                      ),
                      Divider(color: Colors.transparent),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              width: MediaQuery.of(context).size.width * .35,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: colors.lightGrey, width: 2)),
                              child: Text(
                                'NO',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              orderProvider
                                  .cancelOrder(ctx: context, id: orderId)
                                  .then((value) {
                                if (value) {
                                  Navigator.pop(context);
                                  Utils.showTost(
                                      msg: "Order cancelled successfully.");
                                } else {
                                  Navigator.pop(context);
                                  Utils.showTost(msg: "Something went Wrong!");
                                }
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * .35,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: colors.buttonColor,
                              ),
                              child: Text(
                                'YES',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ).then((value) => orderProvider.getOrderList(status: 'pending')),
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
}
