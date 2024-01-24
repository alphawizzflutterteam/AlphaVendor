import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Utils/images.dart';
import 'package:alpha_work/View/ORDER/ordermanagement.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class TotalOrderScreen extends StatefulWidget {
  const TotalOrderScreen({Key? key}) : super(key: key);

  @override
  _TotalOrderScreenState createState() => _TotalOrderScreenState();
}

class _TotalOrderScreenState extends State<TotalOrderScreen> {
  List items = [
    {
      'id': 0,
      'name': 'Pending',
      'image': "assets/svg/new.svg",
      'color': Color(0xFFE17A1A).withOpacity(0.3),
    },
    {
      'id': 1,
      'name': 'Confirmed',
      'image': "assets/svg/confirmed.svg",
      'color': Color(0xFFE92068).withOpacity(0.3),
    },
    {
      'id': 2,
      'name': 'Packaging',
      'image': "assets/svg/pack.svg",
      'color': Color(0xFFCB43D7).withOpacity(0.3),
    },
    {
      'id': 3,
      'name': 'Shipped',
      'image': "assets/svg/ship.svg",
      'color': Color(0xFF00C2ED).withOpacity(0.3),
    },
    {
      'id': 4,
      'name': 'Transit',
      'image': "assets/svg/out.svg",
      'color': Color(0xFF0C77C8).withOpacity(0.3),
    },
    {
      'id': 5,
      'name': 'Delivered',
      'image': "assets/svg/delivered.svg",
      'color': Color(0xFFEDB900).withOpacity(0.3),
    },
    {
      'id': 6,
      'name': 'Returned',
      'image': "assets/svg/return.svg",
      'color': Color(0xFFEDB900).withOpacity(0.3),
    },
    {
      'id': 7,
      'name': 'Failed',
      'image': "assets/svg/cancelled.svg",
      'color': Color(0xFFEDB900).withOpacity(0.3),
    },
    {
      'id': 8,
      'name': 'Cancelled',
      'image': "assets/svg/cancelled.svg",
      'color': Color(0xFFEDB900).withOpacity(0.3),
    },
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: colors.lightGrey,
      appBar: CommanAppbar(appbarTitle: "Total Orders"),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage(Images.bfGrids), fit: BoxFit.fill),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Orders',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFF767680),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '543',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontFamily: 'Readex Pro',
                              fontSize: 36,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      // VerticalDivider(),
                      // Container(
                      //   padding: const EdgeInsets.symmetric(horizontal: 8),
                      //   decoration: BoxDecoration(
                      //     color: colors.buttonColor,
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      //   child: Row(
                      //     children: [
                      //       Icon(
                      //         Icons.arrow_drop_up_outlined,
                      //         size: 30,
                      //         color: Colors.white,
                      //       ),
                      //       Text(
                      //         "15%",
                      //         style: Theme.of(context)
                      //             .textTheme
                      //             .bodyLarge!
                      //             .copyWith(
                      //               color: Colors.white,
                      //             ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Today",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: colors.greyText),
                      ),
                      Text(
                        "20",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * .04,
                    child: VerticalDivider(
                      color: colors.lightTextColor,
                      thickness: 1,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "This Week",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: colors.greyText),
                      ),
                      Text(
                        "150",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * .04,
                    child: VerticalDivider(
                      color: colors.lightTextColor,
                      thickness: 1,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "This Month",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: colors.greyText),
                      ),
                      Text(
                        "2000",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2 / 2.2,
                ),
                scrollDirection: Axis.vertical,
                itemCount: items.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      PageTransition(
                          child: OrderManagement(index: index),
                          type: PageTransitionType.rightToLeft)),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(items[index]['image']),
                        ),
                        Spacer(),
                        Text(
                          '20',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                        ),
                        Spacer(),
                        Text(
                          items[index]['name'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
