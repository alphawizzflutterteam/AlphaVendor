import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Utils/images.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class EditStoreDetailScreen extends StatelessWidget {
  EditStoreDetailScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommanAppbar(appbarTitle: "Store Detail"),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                DottedBorder(
                  borderType: BorderType.Circle,
                  color: colors.buttonColor,
                  child: CircleAvatar(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Images.gallery,
                          height: 30,
                          color: colors.buttonColor,
                        ),
                        Text(
                          "Upload Image",
                          style: TextStyle(
                            fontSize: 12,
                            color: colors.buttonColor,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    radius: (height / width) * 30,
                    backgroundColor: colors.buttonColor.withOpacity(0.2),
                  ),
                ),
                const Divider(color: Colors.transparent),
                TextFormField(
                  decoration: (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(labelText: "Store Name*"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Store Name";
                    }
                    return null;
                  },
                ),
                const Divider(color: Colors.transparent),
                SizedBox(
                  height: height * .1,
                  child: TextFormField(
                    maxLines: 5,
                    decoration: (const InputDecoration())
                        .applyDefaults(Theme.of(context).inputDecorationTheme)
                        .copyWith(labelText: "Description"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter Description";
                      }
                      return null;
                    },
                  ),
                ),
                const Divider(color: Colors.transparent),
                DropdownButtonFormField2(
                    decoration: const InputDecoration()
                        .applyDefaults(Theme.of(context).inputDecorationTheme)
                        .copyWith(contentPadding: EdgeInsets.only(right: 10)),
                    hint: Text("Business Type*",
                        style: TextStyle(
                            color: colors.greyText,
                            fontWeight: FontWeight.normal)),
                    value: null,
                    items: []),
                const Divider(color: Colors.transparent),
                TextFormField(
                  decoration: (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(labelText: "Registration Number*"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enterRegistration Number";
                    }
                    return null;
                  },
                ),
                const Divider(color: Colors.transparent),
                TextFormField(
                  decoration: (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(labelText: "GSTIN*"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter GSTIN";
                    }
                    return null;
                  },
                ),
                const Divider(color: Colors.transparent),
                TextFormField(
                  decoration: (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(labelText: "Email ID*"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Email ID";
                    }
                    return null;
                  },
                ),
                const Divider(color: Colors.transparent),
                TextFormField(
                  decoration: (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(labelText: "Website"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Website";
                    }
                    return null;
                  },
                ),
                const Divider(color: Colors.transparent),
                const Divider(color: Colors.transparent),
                TextFormField(
                  decoration: (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(labelText: "Social Media Links"),
                ),
                const Divider(color: Colors.transparent),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(width * .9, 50)),
                    child: Text(
                      "EDIT STORE DETAIL",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                const Divider(color: Colors.transparent),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
