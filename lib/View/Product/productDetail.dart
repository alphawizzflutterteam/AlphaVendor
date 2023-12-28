import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Utils/images.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool switchVal = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommanAppbar(appbarTitle: "Product Detail"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height * .13,
                  width: width * .29,
                  decoration: BoxDecoration(
                      color: colors.lightGrey,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: AssetImage(Images.powder))),
                ),
                VerticalDivider(color: Colors.transparent),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Acer Moniter",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(color: Colors.transparent, height: 5),
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
                      Divider(color: Colors.transparent, height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Switch(
                            value: switchVal,
                            activeColor: colors.buttonColor,
                            inactiveThumbColor: colors.greyText,
                            inactiveTrackColor: colors.lightGrey,
                            onChanged: (value) => setState(() {
                              switchVal = value;
                            }),
                          ),
                          Text(
                            switchVal ? "Active" : "Inactive",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Icon(Icons.edit, color: Colors.black, size: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Icon(Icons.delete, color: Colors.black, size: 20),
                ),
              ],
            ),
            Divider(height: 15),
            Text(
              "Description",
              style: TextStyle(fontSize: 16, color: colors.greyText),
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
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
                          "Category",
                          style: TextStyle(
                            fontSize: 14,
                            color: colors.greyText,
                          ),
                        ),
                        Text(
                          "Electronic",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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
                          "25",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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
                          "1KG",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
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
                          "Category",
                          style: TextStyle(
                            fontSize: 14,
                            color: colors.greyText,
                          ),
                        ),
                        Text(
                          "Electronic",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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
                          "25",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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
                          "1KG",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
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
    );
  }
}
