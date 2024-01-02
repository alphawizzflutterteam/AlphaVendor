import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/View/Product/model/categoryModel.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class EditBusinessDetailScreen extends StatelessWidget {
  EditBusinessDetailScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommanAppbar(appbarTitle: "Business Detail"),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(labelText: "Email ID"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Email ID";
                    }
                    return null;
                  },
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
                      .copyWith(labelText: "Company or Business Name*"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Company or Business Name*";
                    }
                    return null;
                  },
                ),
                const Divider(color: Colors.transparent),
                TextFormField(
                  decoration: (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(labelText: "Enter GSTIN*"),
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
                      .copyWith(
                          labelText:
                              "Business Registration Number (if applicable)"),
                ),
                const Divider(color: Colors.transparent),
                TextFormField(
                  decoration: (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(labelText: "Tax Identification Number (TIN)*"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Tax Identification Number";
                    }
                    return null;
                  },
                ),
                const Divider(color: Colors.transparent),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(fixedSize: Size(width * .9, 50)),
          child: Text(
            "SAVE",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
