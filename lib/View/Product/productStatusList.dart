import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Utils/images.dart';
import 'package:alpha_work/Widget/appLoader.dart';
import 'package:alpha_work/Widget/errorImage.dart';
import 'package:alpha_work/View/Product/productDetail.dart';
import 'package:alpha_work/ViewModel/productMgmtViewModel.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:searchable_listview/searchable_listview.dart';

class ActiveProductScreen extends StatefulWidget {
  final String appBartitle;
  final String type;

  const ActiveProductScreen(
      {super.key, required this.appBartitle, required this.type});

  @override
  State<ActiveProductScreen> createState() => _ActiveProductScreenState();
}

class _ActiveProductScreenState extends State<ActiveProductScreen> {
  late ProductManagementViewModel productstatusP;
  @override
  void initState() {
    productstatusP =
        Provider.of<ProductManagementViewModel>(context, listen: false);
    productstatusP.getProductsListWithStatus(Type: widget.type);
    super.initState();
  }

  void filterSearchResults(String query) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    productstatusP = Provider.of<ProductManagementViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: CommanAppbar(appbarTitle: widget.appBartitle),
      body: productstatusP.isLoading
          ? appLoader()
          : productstatusP.productList.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(Images.noProduct,
                          height: height * .32,
                          width: width,
                          fit: BoxFit.contain),
                    ),
                    Text(
                      "No ${widget.appBartitle} \nData Found",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: colors.greyText,
                      ),
                    ),
                  ],
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: SearchableList(
                    inputDecoration: (const InputDecoration())
                        .applyDefaults(Theme.of(context).inputDecorationTheme)
                        .copyWith(
                          hintText: "Search",
                          hintStyle: TextStyle(
                              color: colors.greyText,
                              fontWeight: FontWeight.normal),
                        ),
                    filter: (value) => productstatusP.productList
                        .where(
                          (element) => element.name!
                              .toString()
                              .toLowerCase()
                              .contains(value),
                        )
                        .toList(),
                    emptyWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.asset(Images.emptySearch,
                              height: height * .25,
                              width: width,
                              fit: BoxFit.contain),
                        ),
                        Text(
                          "No Data Found",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: colors.greyText,
                          ),
                        ),
                      ],
                    ),
                    initialList: productstatusP.productList,
                    builder: (displayedList, index, item) => GestureDetector(
                      onTap: () => Navigator.push(
                              context,
                              PageTransition(
                                  child: ProductDetailScreen(
                                      id: productstatusP.productList[index].id
                                          .toString()),
                                  type: PageTransitionType.rightToLeft))
                          .then((value) => initState()),
                      child: Container(
                        height: height * .13,
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
                              height: height * .1,
                              width: height * .1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  productstatusP.productList[index].thumbnail
                                      .toString(),
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, url, error) =>
                                      ErrorImageWidget(height: null),
                                ),
                              ),
                            ),
                            VerticalDivider(
                                color: Colors.transparent, width: 7),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: width * .51,
                                  child: Text(
                                    productstatusP.productList[index].name
                                        .toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: width * .5,
                                  child: RichText(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "SKU ID-",
                                          style: TextStyle(
                                            color: colors.greyText,
                                            fontSize: 14,
                                          )),
                                      TextSpan(text: " "),
                                      TextSpan(
                                          text: productstatusP
                                              .productList[index].slug
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          )),
                                    ]),
                                  ),
                                ),
                                SizedBox(
                                  width: width * .63,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: productstatusP
                                                  .productList[index]
                                                  .specialPrice
                                                  .toString(),
                                              style: TextStyle(
                                                color: colors.buttonColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              )),
                                          TextSpan(text: ' '),
                                          TextSpan(
                                              text: productstatusP
                                                  .productList[index].unitPrice
                                                  .toString(),
                                              style: TextStyle(
                                                color: colors.greyText,
                                                fontSize: 14,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              )),
                                        ]),
                                      ),
                                      widget.appBartitle == "All Products"
                                          ? Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: productstatusP
                                                              .productList[
                                                                  index]
                                                              .status ==
                                                          1
                                                      ? Colors.green
                                                          .withOpacity(0.3)
                                                      : Colors.red
                                                          .withOpacity(0.3)),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 3),
                                              child: Text(
                                                productstatusP
                                                            .productList[index]
                                                            .status ==
                                                        1
                                                    ? "Active"
                                                    : "Inactive",
                                                style: TextStyle(
                                                    color: productstatusP
                                                                .productList[
                                                                    index]
                                                                .status ==
                                                            1
                                                        ? Colors.green
                                                        : Colors.redAccent),
                                              ),
                                            )
                                          : Container(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
    );
  }
}
