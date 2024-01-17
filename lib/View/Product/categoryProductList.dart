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

class categoryProductScreen extends StatefulWidget {
  final String appBartitle;
  final String type;
  final String catId;
  final String subCatID;

  const categoryProductScreen(
      {super.key,
      required this.appBartitle,
      required this.type,
      required this.catId,
      required this.subCatID});

  @override
  State<categoryProductScreen> createState() => _categoryProductScreenState();
}

class _categoryProductScreenState extends State<categoryProductScreen> {
  late ProductManagementViewModel productstatusP;
  @override
  void initState() {
    productstatusP =
        Provider.of<ProductManagementViewModel>(context, listen: false);
    print("id's- ${widget.catId}, ${widget.subCatID}");
    productstatusP.getProductsListWithCategory(
        Type: widget.type, catId: widget.catId, subcatId: widget.subCatID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    productstatusP = Provider.of<ProductManagementViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
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
                      child: Image.asset(Images.noOrder,
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
                  child: Column(
                    children: [
                      TextField(
                        decoration: (const InputDecoration())
                            .applyDefaults(
                                Theme.of(context).inputDecorationTheme)
                            .copyWith(
                                hintText: "Search",
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                                prefixIcon: Icon(
                                  Icons.search_rounded,
                                  color: Colors.black,
                                )),
                      ),
                      const Divider(color: Colors.transparent),
                      SizedBox(
                        height: height * .75,
                        child: ListView.builder(
                          itemCount: productstatusP.productList.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () => Navigator.push(
                                    context,
                                    PageTransition(
                                        child: ProductDetailScreen(
                                            id: productstatusP
                                                .productList[index].id
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
                                        productstatusP
                                            .productList[index].thumbnail
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                                TextSpan(text: ' '),
                                                TextSpan(
                                                    text: productstatusP
                                                        .productList[index]
                                                        .unitPrice
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: colors.greyText,
                                                      fontSize: 14,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    )),
                                              ]),
                                            ),
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
                    ],
                  ),
                ),
    );
  }
}
