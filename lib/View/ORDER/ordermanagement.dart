import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Utils/images.dart';
import 'package:alpha_work/View/ORDER/pendingOrderDetail.dart';
import 'package:alpha_work/View/ORDER/pickupSlot.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commanBackground.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/comman_header.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../Widget/CommonAppbarWidget/commonappbar.dart';

import 'package:flutter_custom_tab_bar/library.dart';

class OrderManagement extends StatefulWidget {
  const OrderManagement({super.key});

  @override
  State<OrderManagement> createState() => _OrderManagementState();
}

class _OrderManagementState extends State<OrderManagement> {
  final int pageCount = 20;
  final PageController _controller = PageController();

  final CustomTabBarController _tabBarController = CustomTabBarController();

  List tablist = [
    'New',
    'Ready to ship',
    'Pickup',
    'In Transit',
    'RTO',
    'Delevered',
    'Cancelled',
    'Returned',
    'History'
  ];

  // List oredr
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
            itemCount: tablist.length,
            builder: getTabbarChild,
            indicator: StandardIndicator(
              width: 20,
              height: 2,
              color: Colors.black,
            ),
            pageController: _controller,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Row(
              children: [
                SizedBox(
                  height: 50,
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
                          borderSide:
                              const BorderSide(width: 0, color: Colors.grey)),
                      hintText: "Search ",
                      prefixIcon: const Icon(Icons.search),
                      prefixIconColor: Colors.black,
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
                itemBuilder: (context, index) {
                  return Container(
                    child: ListView.builder(
                        itemCount: 200,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                PageTransition(
                                  child: PendingOrderDetail(),
                                  type: PageTransitionType.rightToLeft,
                                )),
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xFFE9E9E9)),
                              height: MediaQuery.of(context).size.height * .16,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            "CANCEL",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                      VerticalDivider(
                                          color: Colors.transparent),
                                      GestureDetector(
                                        onTap: () => Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              PickupSlotScreen(),
                                        )),
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: colors.buttonColor,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
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
                        }),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget getTabbarChild(BuildContext context, int index) {
    return TabBarItem(
        index: index,
        transform: ScaleTransform(
            maxScale: 1.3,
            transform: ColorsTransform(
              normalColor: Colors.grey,
              highlightColor: Colors.black,
              builder: (context, color) {
                return Container(
                  padding: const EdgeInsets.all(2),
                  alignment: Alignment.center,
                  constraints: const BoxConstraints(minWidth: 70),
                  child: Text(
                    tablist[index],
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
