import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Utils/images.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProdutScreen extends StatefulWidget {
  const AddProdutScreen({super.key});

  @override
  State<AddProdutScreen> createState() => _AddProdutScreenState();
}

class _AddProdutScreenState extends State<AddProdutScreen> {
  int selectedCat = 0;
  var _formKey = GlobalKey<FormState>();
  final List<DropdownMenuItem> items = [
    DropdownMenuItem(child: Text("Sunday"), value: "Sunday"),
    DropdownMenuItem(child: Text("Monday"), value: "Monday"),
    DropdownMenuItem(child: Text("Tuesday"), value: "Tuesday"),
    DropdownMenuItem(child: Text("Wednesday"), value: "Wednesday"),
    DropdownMenuItem(child: Text("Thursday"), value: "Thursday"),
    DropdownMenuItem(child: Text("Friday"), value: "Friday"),
    DropdownMenuItem(child: Text("Saturday"), value: "Saturday"),
  ];

  String? selectedValue;
  bool switchVal = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: CommanAppbar(appbarTitle: "Add Product"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    selectedCat = 0;
                  }),
                  child: Container(
                    width: width * .43,
                    height: 50,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: selectedCat == 0
                            ? Color(0xFFCEEAEA)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "Add Product",
                      style: TextStyle(
                          color: selectedCat == 0
                              ? colors.buttonColor
                              : colors.greyText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                VerticalDivider(color: Colors.transparent),
                GestureDetector(
                  onTap: () => setState(() {
                    selectedCat = 1;
                  }),
                  child: Container(
                    width: width * .43,
                    height: 50,
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: selectedCat == 1
                          ? Color(0xFFCEEAEA)
                          : Colors.transparent,
                    ),
                    child: Text(
                      "Request Category",
                      style: TextStyle(
                          color: selectedCat == 1
                              ? colors.buttonColor
                              : colors.greyText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Divider(color: Colors.transparent),
            Form(
              key: _formKey,
              child: selectedCat == 0
                  ? SizedBox(
                      height: height * .7,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: (const InputDecoration())
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(labelText: "Product Name"),
                            ),
                            const Divider(color: Colors.transparent),
                            DropdownButtonFormField2(
                              decoration: const InputDecoration().applyDefaults(
                                  Theme.of(context).inputDecorationTheme),
                              hint: Text("Select Category",
                                  style: TextStyle(color: colors.greyText)),
                              value: selectedValue,
                              onChanged: (value) => setState(() {
                                selectedValue = value ?? "";
                              }),
                              items: items,
                            ),
                            const Divider(color: Colors.transparent),
                            DropdownButtonFormField2(
                              decoration: const InputDecoration().applyDefaults(
                                  Theme.of(context).inputDecorationTheme),
                              hint: Text("Select Sub Category",
                                  style: TextStyle(color: colors.greyText)),
                              value: selectedValue,
                              onChanged: (value) => setState(() {
                                selectedValue = value ?? "";
                              }),
                              items: items,
                            ),
                            const Divider(color: Colors.transparent),
                            DropdownButtonFormField2(
                              decoration: const InputDecoration().applyDefaults(
                                  Theme.of(context).inputDecorationTheme),
                              hint: Text("Quantity in Stock",
                                  style: TextStyle(color: colors.greyText)),
                              value: selectedValue,
                              onChanged: (value) => setState(() {
                                selectedValue = value ?? "";
                              }),
                              items: items,
                            ),
                            const Divider(color: Colors.transparent),
                            TextFormField(
                              decoration: (const InputDecoration())
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(labelText: "SKU ID"),
                            ),
                            const Divider(color: Colors.transparent),
                            TextFormField(
                              decoration: (const InputDecoration())
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(labelText: "Add Tags"),
                            ),
                            const Divider(color: Colors.transparent),
                            TextFormField(
                              decoration: (const InputDecoration())
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(
                                      labelText:
                                          "Add details or highlights (In Points)"),
                            ),
                            const Divider(color: Colors.transparent),
                            SizedBox(
                              height: height * .15,
                              child: TextFormField(
                                maxLines: 5,
                                decoration: (const InputDecoration())
                                    .applyDefaults(
                                        Theme.of(context).inputDecorationTheme)
                                    .copyWith(
                                      labelText: "Short Description",
                                    ),
                              ),
                            ),
                            const Divider(color: Colors.transparent),
                            DropdownButtonFormField2(
                              decoration: const InputDecoration().applyDefaults(
                                  Theme.of(context).inputDecorationTheme),
                              hint: Text("Select Tax",
                                  style: TextStyle(color: colors.greyText)),
                              value: selectedValue,
                              onChanged: (value) => setState(() {
                                selectedValue = value ?? "";
                              }),
                              items: items,
                            ),
                            const Divider(color: Colors.transparent),
                            DropdownButtonFormField2(
                              decoration: const InputDecoration().applyDefaults(
                                  Theme.of(context).inputDecorationTheme),
                              hint: Text("Select Indicator",
                                  style: TextStyle(color: colors.greyText)),
                              value: selectedValue,
                              onChanged: (value) => setState(() {
                                selectedValue = value ?? "";
                              }),
                              items: items,
                            ),
                            const Divider(color: Colors.transparent),
                            TextFormField(
                              decoration: (const InputDecoration())
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(
                                      labelText: "Total Allowed Quantity"),
                            ),
                            const Divider(color: Colors.transparent),
                            TextFormField(
                              decoration: (const InputDecoration())
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(
                                      labelText: "Minimum Order Quantity"),
                            ),
                            const Divider(color: Colors.transparent),
                            TextFormField(
                              decoration: (const InputDecoration())
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(labelText: "Warranty Period"),
                            ),
                            const Divider(color: Colors.transparent),
                            TextFormField(
                              decoration: (const InputDecoration())
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(labelText: "Guarantee Period"),
                            ),
                            const Divider(color: Colors.transparent),
                            TextFormField(
                              decoration: (const InputDecoration())
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(labelText: "Brand Name"),
                            ),
                            const Divider(color: Colors.transparent),
                            TextFormField(
                              decoration: (const InputDecoration())
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(labelText: "Deliverable Type"),
                            ),
                            const Divider(color: Colors.transparent),
                            DropdownButtonFormField2(
                              decoration: const InputDecoration().applyDefaults(
                                  Theme.of(context).inputDecorationTheme),
                              hint: Text("Select Color",
                                  style: TextStyle(color: colors.greyText)),
                              value: selectedValue,
                              onChanged: (value) => setState(() {
                                selectedValue = value ?? "";
                              }),
                              items: items,
                            ),
                            const Divider(color: Colors.transparent),
                            Row(
                              children: [
                                DottedBorder(
                                  color: colors.buttonColor,
                                  strokeWidth: 1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFD5F6F6),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            Images.selectImage,
                                            height: 30,
                                            width: 30,
                                            fit: BoxFit.fitHeight,
                                          ),
                                          Text(
                                            "Main Image",
                                            style: TextStyle(
                                              color: colors.buttonColor,
                                              fontSize: 12,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                VerticalDivider(color: Colors.transparent),
                                Container(
                                  height: height * .1,
                                  width: width * .25,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: colors.lightGrey,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    "Image\nContainer",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(color: Colors.transparent),
                            Row(
                              children: [
                                DottedBorder(
                                  color: colors.buttonColor,
                                  strokeWidth: 1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFD5F6F6),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            Images.selectImage,
                                            height: 30,
                                            width: 30,
                                            fit: BoxFit.fitHeight,
                                          ),
                                          Text(
                                            "Other Image",
                                            style: TextStyle(
                                              color: colors.buttonColor,
                                              fontSize: 12,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                VerticalDivider(color: Colors.transparent),
                                Container(
                                  height: height * .1,
                                  width: width * .25,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: colors.lightGrey,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    "Image\nContainer",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(color: Colors.transparent),
                            Row(
                              children: [
                                DottedBorder(
                                  color: colors.buttonColor,
                                  strokeWidth: 1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: width * .24,
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFD5F6F6),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Icon(
                                              Icons.play_circle_outline_rounded,
                                              color: colors.buttonColor,
                                              size: 25),
                                          Text(
                                            "Video",
                                            style: TextStyle(
                                              color: colors.buttonColor,
                                              fontSize: 12,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                VerticalDivider(color: Colors.transparent),
                                Container(
                                  height: height * .1,
                                  width: width * .25,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: colors.lightGrey,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    "Video\nContainer",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(color: Colors.transparent),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * .78,
                                  child: TextFormField(
                                    decoration: (const InputDecoration())
                                        .applyDefaults(Theme.of(context)
                                            .inputDecorationTheme)
                                        .copyWith(labelText: "Coupon"),
                                  ),
                                ),
                                Switch(
                                  value: switchVal,
                                  activeColor: colors.buttonColor,
                                  inactiveThumbColor: colors.greyText,
                                  inactiveTrackColor: colors.lightGrey,
                                  onChanged: (value) => setState(() {
                                    switchVal = value;
                                  }),
                                )
                              ],
                            ),
                            const Divider(color: Colors.transparent),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(
                      height: height * .7,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              decoration: (const InputDecoration())
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(labelText: "Brand Name"),
                            ),
                            const Divider(color: Colors.transparent),
                            TextFormField(
                              decoration: (const InputDecoration())
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(labelText: "Category Name"),
                            ),
                            const Divider(color: Colors.transparent),
                            TextFormField(
                              decoration: (const InputDecoration())
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(labelText: "Sub Category Name"),
                            ),
                            const Divider(color: Colors.transparent),
                            SizedBox(
                              height: height * .15,
                              child: TextFormField(
                                maxLines: 5,
                                decoration: (const InputDecoration())
                                    .applyDefaults(
                                        Theme.of(context).inputDecorationTheme)
                                    .copyWith(
                                      labelText: "Short Description",
                                    ),
                              ),
                            ),
                            const Divider(color: Colors.transparent),
                            TextFormField(
                              decoration: (const InputDecoration())
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(labelText: "Meta Tag"),
                            ),
                            const Divider(color: Colors.transparent),
                            Row(
                              children: [
                                DottedBorder(
                                  color: colors.buttonColor,
                                  strokeWidth: 1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 15),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFD5F6F6),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            Images.selectImage,
                                            height: 30,
                                            width: 30,
                                            fit: BoxFit.fitHeight,
                                          ),
                                          Text(
                                            "Thumbnail\nImage",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: colors.buttonColor,
                                              fontSize: 12,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                VerticalDivider(color: Colors.transparent),
                                Container(
                                  height: height * .1,
                                  width: width * .25,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: colors.lightGrey,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    "Image\nContainer",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(color: Colors.transparent),
                            Text(
                              "Attributes and Filters",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const Divider(color: Colors.transparent),
                            DropdownButtonFormField2(
                              decoration: const InputDecoration().applyDefaults(
                                  Theme.of(context).inputDecorationTheme),
                              hint: Text("Size",
                                  style: TextStyle(color: colors.greyText)),
                              value: selectedValue,
                              onChanged: (value) => setState(() {
                                selectedValue = value ?? "";
                              }),
                              items: items,
                            ),
                            const Divider(color: Colors.transparent),
                            DropdownButtonFormField2(
                              decoration: const InputDecoration().applyDefaults(
                                  Theme.of(context).inputDecorationTheme),
                              hint: Text("Color",
                                  style: TextStyle(color: colors.greyText)),
                              value: selectedValue,
                              onChanged: (value) => setState(() {
                                selectedValue = value ?? "";
                              }),
                              items: items,
                            ),
                            const Divider(color: Colors.transparent),
                          ],
                        ),
                      ),
                    ),
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(width, 50),
                    backgroundColor: colors.buttonColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text(
                  selectedCat == 0 ? "ADD PRODUCT" : "REQUEST CATEGORY",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
