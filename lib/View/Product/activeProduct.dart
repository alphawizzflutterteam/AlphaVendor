import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Utils/images.dart';
import 'package:alpha_work/View/Product/productDetail.dart';
import 'package:alpha_work/ViewModel/productMgmtViewModel.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ActiveProductScreen extends StatefulWidget {
  const ActiveProductScreen({super.key});

  @override
  State<ActiveProductScreen> createState() => _ActiveProductScreenState();
}

class _ActiveProductScreenState extends State<ActiveProductScreen> {
  late ProductManagementViewModel productstatusP;
  @override
  void initState() {
    productstatusP = Provider.of(context, listen: false);
    productstatusP.getActiveProducts(Type: '1');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    productstatusP = Provider.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommanAppbar(appbarTitle: "Active Products"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            TextField(
              decoration: (const InputDecoration())
                  .applyDefaults(Theme.of(context).inputDecorationTheme)
                  .copyWith(
                      hintText: "Search",
                      hintStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: Colors.black,
                      )),
            ),
            Divider(color: Colors.transparent),
            SizedBox(
              height: height * .78,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      PageTransition(
                          child: ProductDetailScreen(),
                          type: PageTransitionType.rightToLeft)),
                  child: Container(
                    height: 100,
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: colors.lightGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage(Images.powder))),
                        ),
                        VerticalDivider(color: Colors.transparent),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Acer Moniter",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "\$200",
                                    style: TextStyle(
                                      color: colors.greyText,
                                      fontSize: 14,
                                      decoration: TextDecoration.lineThrough,
                                    )),
                                TextSpan(text: "  "),
                                TextSpan(
                                    text: "\$120",
                                    style: TextStyle(
                                      color: colors.buttonColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ]),
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "SKU ID-",
                                    style: TextStyle(
                                      color: colors.greyText,
                                      fontSize: 14,
                                    )),
                                TextSpan(text: "  "),
                                TextSpan(
                                    text: "White526",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ]),
                            ),
                          ],
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.topRight,
                          child: PopupMenuButton(
                            itemBuilder: (context) {
                              return {'Active', 'Edit', 'Delete'}
                                  .map((String choice) {
                                return PopupMenuItem<String>(
                                  value: choice,
                                  child: Text(choice),
                                );
                              }).toList();
                            },
                            iconColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
