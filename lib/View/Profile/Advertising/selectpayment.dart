import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Utils/images.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:flutter/material.dart';

class SelectPaymentScreen extends StatelessWidget {
  SelectPaymentScreen({super.key});
  bool Selected = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommanAppbar(appbarTitle: "Payment Method"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Payment Method",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            const Divider(color: Colors.transparent),
            Container(
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colors.lightGrey,
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Banner Adverting",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "\$120.00",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.transparent),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: colors.lightGrey,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    Images.visa,
                    height: 25,
                  ),
                  const VerticalDivider(
                    color: Colors.transparent,
                    width: 5,
                  ),
                  Text(
                    "Visa",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Radio(
                    value: Selected,
                    groupValue: true,
                    activeColor: colors.buttonColor,
                    onChanged: (value) => {},
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.transparent),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: colors.lightGrey,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    Images.phonePay,
                    height: 25,
                  ),
                  const VerticalDivider(
                    color: Colors.transparent,
                    width: 5,
                  ),
                  Text(
                    "Phone Pay",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Radio(
                    value: true,
                    groupValue: false,
                    activeColor: colors.buttonColor,
                    onChanged: (value) => {},
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.transparent),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: colors.lightGrey,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    Images.upi,
                    height: 25,
                  ),
                  const VerticalDivider(
                    color: Colors.transparent,
                    width: 5,
                  ),
                  Text(
                    "UPI",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Radio(
                    value: true,
                    groupValue: false,
                    activeColor: colors.buttonColor,
                    onChanged: (value) => {},
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.transparent),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: colors.lightGrey,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    Images.google,
                    height: 40,
                  ),
                  const VerticalDivider(
                    color: Colors.transparent,
                    width: 5,
                  ),
                  Text(
                    "Google Pay",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Radio(
                    value: true,
                    groupValue: false,
                    activeColor: colors.buttonColor,
                    onChanged: (value) => {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(fixedSize: Size(width * .9, 50)),
          child: Text(
            "CONTINUE",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
