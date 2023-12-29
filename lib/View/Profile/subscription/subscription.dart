import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  List<Color> getCardGradients({required String type}) {
    switch (type) {
      case "Premium":
        return [colors.lightGrey.withOpacity(0.5), Colors.transparent];
      case "Gold":
        return [Colors.amber.withOpacity(0.7), Colors.transparent];
      case "Basic":
        return [colors.buttonColor, Colors.transparent];
      default:
        return [Colors.white30, Colors.transparent];
    }
  }

  bool isYearlyTabSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommanAppbar(appbarTitle: "Subscription"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTabButton("Yearly", isYearlyTabSelected, () {
                  setState(() {
                    isYearlyTabSelected = true;
                  });
                }),
                buildTabButton("Monthly", !isYearlyTabSelected, () {
                  setState(() {
                    isYearlyTabSelected = false;
                  });
                }),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * .735),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: isYearlyTabSelected
                    ? //subscriptionProvider.subscriptionList[0].yearly.length
                    2
                    : //subscriptionProvider.subscriptionList[0].monthly.length,
                    1,
                separatorBuilder: (context, _) => SizedBox(height: 20),
                itemBuilder: (context, index) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                      // color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          colors: getCardGradients(
                              type: isYearlyTabSelected ? "Premium" : "Gold"),
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // isYearlyTabSelected
                                //     ? subscriptionProvider
                                //         .subscriptionList[0].yearly[index].title
                                //         .toString()
                                //     : subscriptionProvider.subscriptionList[0]
                                //         .monthly[index].title
                                //         .toString(),
                                "Premium",
                                style: TextStyle(
                                  fontSize: 20, // Adjust the size as needed
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black, // Customize the color
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text.rich(
                                TextSpan(
                                  text: '\$', // The dollar sign
                                  style: TextStyle(
                                    fontSize: 18, // Adjust the size as needed
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.black87, // Customize the color
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      // text: isYearlyTabSelected
                                      //     ? subscriptionProvider
                                      //         .subscriptionList[0]
                                      //         .yearly[index]
                                      //         .price
                                      //         .toString()
                                      //     : subscriptionProvider
                                      //         .subscriptionList[0]
                                      //         .monthly[index]
                                      //         .price
                                      //         .toString(),
                                      text: "\$999",
                                      style: TextStyle(
                                        fontSize:
                                            24, // Adjust the size as needed
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors
                                                .black, //Customize the color
                                      ),
                                    ),
                                    TextSpan(
                                      text: isYearlyTabSelected
                                          ? "/ year"
                                          : ' / month',
                                      style: TextStyle(
                                        fontSize:
                                            18, // Adjust the size as needed
                                        fontWeight: FontWeight.normal,
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors
                                                .black, // Customize the color
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          isYearlyTabSelected
                              ? true
                                  ? Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons
                                                  .check_circle_outline_rounded,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              "CURRENT PLAN",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          // isYearlyTabSelected
                                          //     ? subscriptionProvider
                                          //         .subscriptionList[0]
                                          //         .yearly[index]
                                          //         .createdAt
                                          //         .toString()
                                          //     : subscriptionProvider
                                          //         .subscriptionList[0]
                                          //         .monthly[index]
                                          //         .createdAt
                                          //         .toString(),
                                          "Created At",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    )
                                  : UpgradePlanWidget(showHeader: false)
                              : true
                                  ? Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons
                                                  .check_circle_outline_rounded,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              "CURRENT PLAN",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          // isYearlyTabSelected
                                          //     ? subscriptionProvider
                                          //         .subscriptionList[0]
                                          //         .yearly[index]
                                          //         .createdAt
                                          //         .toString()
                                          //     : subscriptionProvider
                                          //         .subscriptionList[0]
                                          //         .monthly[index]
                                          //         .createdAt
                                          //         .toString(),
                                          "Created At",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    )
                                  : UpgradePlanWidget(showHeader: false),
                        ],
                      ),
                      Divider(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? colors.lightGrey
                            : Colors.white.withOpacity(0.5),
                      ),
                      Html(
                        data: "Description Data",
                        // data: isYearlyTabSelected
                        //     ? subscriptionProvider
                        //         .subscriptionList[0].yearly[index].description
                        //     : subscriptionProvider
                        //         .subscriptionList[0].monthly[index].description,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabButton(String label, bool isSelected, VoidCallback onPressed) {
    Color textColor = isSelected ? Colors.black : Colors.white;

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 45,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: isSelected ? colors.buttonColor : Colors.transparent,
            onPrimary: textColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text(
          label,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}

class UpgradePlanWidget extends StatelessWidget {
  const UpgradePlanWidget({
    super.key,
    required this.showHeader,
  });

  final bool showHeader;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: MediaQuery.of(context).size.width * 0.3,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.black,
            padding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        onPressed: () {
          // Routes.navigateToPaymentScreen(context, "");
        },
        child: Text(
          showHeader ? 'SUBSCRIBE NOW' : 'UPGRADE PLAN',
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
