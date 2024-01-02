import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Utils/images.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommanAppbar(appbarTitle: "Edit Profile"),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: (height / width) * 80,
                  width: (height / width) * 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colors.buttonColor,
                  ),
                  child: Image.asset(Images.driver_profile),
                ),
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      size: 18,
                    ),
                    label: Text("Edit Image")),
                const Divider(color: Colors.transparent),
                TextFormField(
                  decoration: (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(labelText: "Full Name*"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Full Name";
                    }
                    return null;
                  },
                ),
                const Divider(color: Colors.transparent),
                TextFormField(
                  decoration: (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(labelText: "Personal Email ID*"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Personal Email ID";
                    }
                    return null;
                  },
                ),
                const Divider(color: Colors.transparent),
                TextFormField(
                  decoration: (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(labelText: "Personal Phone Number*"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Phone Number";
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
    );
  }
}
