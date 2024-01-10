import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Utils/images.dart';
import 'package:alpha_work/View/Product/editProduct.dart';
import 'package:alpha_work/ViewModel/productMgmtViewModel.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:alpha_work/Widget/appLoader.dart';
import 'package:alpha_work/Widget/errorImage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:html/parser.dart' show parse;

class ProductDetailScreen extends StatefulWidget {
  final String id;

  const ProductDetailScreen({super.key, required this.id});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late bool switchVal;
  late ProductManagementViewModel productP;

  getData() async {
    productP = Provider.of<ProductManagementViewModel>(context, listen: false);
    await productP.getProductDetail(id: widget.id);
    switchVal =
        productP.productDetail.first.status.toString() == "1" ? true : false;
  }

  @override
  void initState() {
    print(widget.id);
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    productP = Provider.of<ProductManagementViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommanAppbar(appbarTitle: "Product Detail"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: productP.isLoading
            ? appLoader()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: height * .13,
                          width: width * .29,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: colors.lightGrey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              productP.productDetail.first.thumbnail.toString(),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  ErrorImageWidget(height: height),
                            ),
                          ),
                        ),
                        VerticalDivider(color: Colors.transparent),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ConstrainedBox(
                                constraints:
                                    BoxConstraints(maxWidth: width * .5),
                                child: Text(
                                  productP.productDetail.first.name.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Divider(color: Colors.transparent, height: 5),
                              ConstrainedBox(
                                constraints:
                                    BoxConstraints(maxWidth: width * .5),
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
                                    TextSpan(text: "  "),
                                    TextSpan(
                                        text: productP.productDetail.first.slug
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ]),
                                ),
                              ),
                              Divider(color: Colors.transparent, height: 5),
                              ConstrainedBox(
                                constraints:
                                    BoxConstraints(maxWidth: width * .5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      productP.productDetail.first.specialPrice
                                          .toString(),
                                      maxFontSize: 24,
                                      minFontSize: 20,
                                      style: TextStyle(
                                          color: colors.buttonColor,
                                          fontFamily: 'Montreal',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    VerticalDivider(
                                        color: Colors.transparent, width: 5),
                                    AutoSizeText(
                                      productP.productDetail.first.unitPrice
                                          .toString(),
                                      maxFontSize: 16,
                                      minFontSize: 14,
                                      style: TextStyle(
                                        color: colors.greyText,
                                        fontFamily: 'Montreal',
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: height * .02),
                    Divider(color: colors.lightGrey, height: 1),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Spacer(),
                            Switch(
                                value: switchVal,
                                activeColor: colors.buttonColor,
                                inactiveThumbColor: colors.greyText,
                                inactiveTrackColor: colors.lightGrey,
                                onChanged: (value) {
                                  setState(() {
                                    productP
                                        .updateProductStatus(
                                            id: productP.productDetail.first.id
                                                .toString(),
                                            status: value ? "1" : "0")
                                        .then((_) {
                                      switchVal = value;
                                      Fluttertoast.showToast(
                                          msg: "Updated successfully!",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.TOP,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: colors.buttonColor,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    });
                                  });
                                }),
                            const VerticalDivider(width: 5),
                            Text(
                              switchVal ? "Active" : "Inactive",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            Spacer(),
                            const VerticalDivider(
                              width: 1,
                              indent: 10,
                              endIndent: 10,
                              color: colors.greyText,
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                      context,
                                      PageTransition(
                                          child: EditProdutScreen(
                                              productDetail:
                                                  productP.productDetail.first),
                                          type: PageTransitionType.rightToLeft))
                                  .then((value) => getData()),
                              child: Row(
                                children: [
                                  ImageIcon(
                                    AssetImage(Images.edit),
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                  const VerticalDivider(width: 5),
                                  Text(
                                    "Edit",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            VerticalDivider(
                              width: 1,
                              indent: 10,
                              endIndent: 10,
                              color: colors.greyText,
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () => showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    title: const Text('Delete This Product'),
                                    content: const Text(
                                        'Do you want to delete this product.'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('No'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      ElevatedButton(
                                        child: const Text(
                                          'Yes',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: () async {
                                          await productP
                                              .deleteProduct(
                                                  id: productP
                                                      .productDetail.first.id
                                                      .toString())
                                              .then((value) => AwesomeDialog(
                                                    context: context,
                                                    dialogType:
                                                        DialogType.success,
                                                    animType: AnimType.scale,
                                                    autoDismiss: false,
                                                    onDismissCallback:
                                                        (type) {},
                                                    title:
                                                        "Product Deleted Successfully",
                                                    btnOkOnPress: () {
                                                      Navigator.pop(context);
                                                    },
                                                  )..show());
                                          Navigator.pop(context, true);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ).then((value) => Navigator.pop(context)),
                              child: Row(
                                children: [
                                  ImageIcon(
                                    AssetImage(Images.delete_icon),
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                  const VerticalDivider(width: 5),
                                  Text(
                                    "Delete",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                    Divider(color: colors.lightGrey, height: 1),
                    SizedBox(height: height * .02),
                    Text(
                      "Description",
                      style: TextStyle(fontSize: 16, color: colors.greyText),
                    ),
                    Html(data: productP.productDetail.first.details.toString()),
                    // Text(
                    //   productP.productDetail.first.details.toString(),
                    //   style: TextStyle(fontSize: 16, color: Colors.black),
                    // ),
                    Divider(height: 25),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Warranty",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: colors.greyText,
                                  ),
                                ),
                                Text(
                                  productP.productDetail.first.warranty
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(color: Colors.transparent, height: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Stocks",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: colors.greyText,
                                  ),
                                ),
                                Text(
                                  productP.productDetail.first.currentStock
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(color: Colors.transparent, height: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Package Weight",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: colors.greyText,
                                  ),
                                ),
                                Text(
                                  productP.productDetail.first.weight
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Purchase Price",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: colors.greyText,
                                  ),
                                ),
                                Text(
                                  productP.productDetail.first.purchasePrice
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontFamily: "Montreal"),
                                ),
                              ],
                            ),
                            const Divider(color: Colors.transparent, height: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Manufacturing Date",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: colors.greyText,
                                  ),
                                ),
                                Text(
                                  productP.productDetail.first.manufacturingDate
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(color: Colors.transparent, height: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Manufactured In",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: colors.greyText,
                                  ),
                                ),
                                Text(
                                  productP.productDetail.first.madeIn
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
      ),
      // floatingActionButton: ElevatedButton(
      //   onPressed: () {},
      //   style: ElevatedButton.styleFrom(fixedSize: Size(width * .9, 50)),
      //   child: Text(
      //     "SCHEDULE TIME TO ACTIVE",
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontSize: 14,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      // ),
    );
  }
}
