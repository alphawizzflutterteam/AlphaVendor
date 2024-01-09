import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/ViewModel/profileViewModel.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:alpha_work/Widget/appLoader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart';
import 'package:provider/provider.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  List<Color> getCardGradients({required String type}) {
    switch (type) {
      case "Yearly":
        return [Colors.amber.withOpacity(0.7), Colors.grey.shade400];
      case "Monthly":
        return [colors.buttonColor, Colors.grey.shade400];
      default:
        return [Colors.white30, Colors.transparent];
    }
  }

  late ProfileViewModel subscriptionProvider;
  @override
  void initState() {
    subscriptionProvider =
        Provider.of<ProfileViewModel>(context, listen: false);
    subscriptionProvider.getSubscriptions();
    super.initState();
  }

  bool isYearlyTabSelected = true;
  @override
  Widget build(BuildContext context) {
    subscriptionProvider = Provider.of<ProfileViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommanAppbar(appbarTitle: "Subscription"),
      body: subscriptionProvider.isLoading
          ? appLoader()
          : Padding(
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
                          ? subscriptionProvider.yearly.length
                          : subscriptionProvider.monthly.length,
                      separatorBuilder: (context, _) => SizedBox(height: 20),
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                            // color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: getCardGradients(
                                    type: isYearlyTabSelected
                                        ? "Yearly"
                                        : "Monthly"),
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
                                      isYearlyTabSelected
                                          ? subscriptionProvider
                                              .yearly[index].title
                                              .toString()
                                          : subscriptionProvider
                                              .monthly[index].title
                                              .toString(),
                                      style: TextStyle(
                                        fontSize:
                                            20, // Adjust the size as needed
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors
                                                .black, // Customize the color
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        style: TextStyle(
                                          fontSize:
                                              18, // Adjust the size as needed
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Colors
                                                  .black87, // Customize the color
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: isYearlyTabSelected
                                                ? subscriptionProvider
                                                    .yearly[index].price
                                                    .toString()
                                                : subscriptionProvider
                                                    .monthly[index].price
                                                    .toString(),
                                            style: TextStyle(
                                              fontSize:
                                                  24, // Adjust the size as needed
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                          .brightness ==
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
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors
                                                      .black, // Customize the color
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                isYearlyTabSelected
                                    ? subscriptionProvider
                                            .yearly[index].isPurchased
                                        ? CurrentPlanText()
                                        : SubscribeBtn()
                                    : subscriptionProvider
                                            .monthly[index].isPurchased
                                        ? CurrentPlanText()
                                        : SubscribeBtn(),
                              ],
                            ),
                            Divider(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? colors.lightGrey
                                  : Colors.white.withOpacity(0.5),
                            ),
                            Html(
                              data: isYearlyTabSelected
                                  ? subscriptionProvider
                                      .yearly[index].description
                                  : subscriptionProvider
                                      .monthly[index].description,
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

class SubscribeBtn extends StatelessWidget {
  const SubscribeBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        child: Text(
          "Subscribe Now",
          style: TextStyle(color: Colors.black),
        ));
  }
}

class CurrentPlanText extends StatelessWidget {
  const CurrentPlanText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.check_circle_outline_rounded,
          color: Colors.white,
        ),
        Text(
          "Current Plan",
          style: TextStyle(fontSize: 16, color: Colors.white),
        )
      ],
    );
  }
}
