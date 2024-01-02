import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommanAppbar(appbarTitle: "Notifications"),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: colors.lightGrey,
          ),
          itemCount: 50,
          itemBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New Order Placed",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "Lorem Ipsum is simply dummy text of the printing \nand typesetting industry. ",
                style: TextStyle(
                  fontSize: 12,
                  color: colors.greyText,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
