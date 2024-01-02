import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class EditBankingDetailScreen extends StatelessWidget {
  EditBankingDetailScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommanAppbar(appbarTitle: "Banking Information"),
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
                      .copyWith(labelText: "Bank Name*"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Bank Name";
                    }
                    return null;
                  },
                ),
                const Divider(color: Colors.transparent),
                TextFormField(
                  decoration: (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(labelText: "Bank Branch*"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Bank Branch";
                    }
                    return null;
                  },
                ),
                const Divider(color: Colors.transparent),
                DropdownButtonFormField2(
                    decoration: const InputDecoration()
                        .applyDefaults(Theme.of(context).inputDecorationTheme)
                        .copyWith(contentPadding: EdgeInsets.only(right: 10)),
                    hint: Text("Account Type*",
                        style: TextStyle(
                            color: colors.greyText,
                            fontWeight: FontWeight.normal)),
                    value: null,
                    items: []),
                const Divider(color: Colors.transparent),
                TextFormField(
                  decoration: (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(labelText: " MICR code*"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter MICR code";
                    }
                    return null;
                  },
                ),
                const Divider(color: Colors.transparent),
                TextFormField(
                  decoration: (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(labelText: "Bank address*"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Bank address";
                    }
                    return null;
                  },
                ),
                const Divider(color: Colors.transparent),
                TextFormField(
                  decoration: (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(labelText: "Account Number*"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Account Number";
                    }
                    return null;
                  },
                ),
                const Divider(color: Colors.transparent),
                TextFormField(
                  decoration: (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(labelText: "IFSC Code*"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter IFSC Code";
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
