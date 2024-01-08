import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/ViewModel/profileViewModel.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController oldPass = TextEditingController();
  final TextEditingController newPass = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();
  late ProfileViewModel profileP;
  @override
  void initState() {
    profileP = Provider.of(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommanAppbar(appbarTitle: "Change Password"),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: oldPass,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Please enter old passward";
                    }
                    return null;
                  },
                  decoration: (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(
                        labelText: "Old Password",
                      ),
                ),
                Divider(color: Colors.transparent),
                TextFormField(
                  controller: newPass,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Please enter new passward";
                    }
                    return null;
                  },
                  decoration: (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(
                        labelText: "New Password",
                      ),
                ),
                Divider(color: Colors.transparent),
                TextFormField(
                  controller: confirmPass,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Please enter passward";
                    }
                    return null;
                  },
                  decoration: (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(
                        labelText: "Confirm Password",
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              if (oldPass.text == newPass.text) {
                Fluttertoast.showToast(
                    msg: "New password cannot be same as Old password");
              } else if (newPass.text != confirmPass.text) {
                Fluttertoast.showToast(msg: "Password do not match");
              } else {
                profileP
                    .cahngePassword(
                        old_password: oldPass.text.toString(),
                        newPass: newPass.text.toString(),
                        confirmPass: confirmPass.text.toString())
                    .then((value) => Fluttertoast.showToast(
                          msg: value,
                          backgroundColor: colors.buttonColor,
                          textColor: Colors.white,
                        ));
              }
            }
          },
          style: ElevatedButton.styleFrom(
              fixedSize: Size(MediaQuery.of(context).size.width, 40)),
          child: Text(
            "CHANGE PASSWORD",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
