import 'package:alpha_work/Model/vendorProfileModel.dart';
import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/ViewModel/profileViewModel.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class EditBankingDetailScreen extends StatefulWidget {
  EditBankingDetailScreen({super.key, required this.vendorData});
  final VendorData vendorData;
  @override
  State<EditBankingDetailScreen> createState() =>
      _EditBankingDetailScreenState();
}

class _EditBankingDetailScreenState extends State<EditBankingDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController branchCtrl = TextEditingController();
  final TextEditingController micrrl = TextEditingController();
  final TextEditingController addrCtrl = TextEditingController();
  final TextEditingController accNoCtrl = TextEditingController();
  final TextEditingController ifscCtrl = TextEditingController();
  String? selectedVal;
  List<DropdownMenuItem> items = [
    DropdownMenuItem(
        child: Text(
          "Saving Account",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
        value: "Saving Account"),
    DropdownMenuItem(
        child: Text(
          "Current Account",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
        value: "Current Account"),
  ];
  late ProfileViewModel profilePro;
  @override
  void initState() {
    nameCtrl.text = widget.vendorData.bankName.toString();
    branchCtrl.text = widget.vendorData.branch.toString();
    micrrl.text = widget.vendorData.micrCode.toString();
    addrCtrl.text = widget.vendorData.bankAddress.toString();
    accNoCtrl.text = widget.vendorData.accountNo.toString();
    ifscCtrl.text = widget.vendorData.ifscCode.toString();
    selectedVal = widget.vendorData.accountType.toString();
    profilePro = Provider.of<ProfileViewModel>(context, listen: false);
    super.initState();
  }

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
                  controller: nameCtrl,
                  textInputAction: TextInputAction.next,
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
                  controller: branchCtrl,
                  textInputAction: TextInputAction.next,
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
                    value: selectedVal,
                    onChanged: (value) {
                      setState(() {
                        selectedVal = value;
                      });
                    },
                    items: items),
                const Divider(color: Colors.transparent),
                TextFormField(
                  controller: micrrl,
                  textInputAction: TextInputAction.next,
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
                  controller: addrCtrl,
                  textInputAction: TextInputAction.next,
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
                  controller: accNoCtrl,
                  textInputAction: TextInputAction.next,
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
                  controller: ifscCtrl,
                  textInputAction: TextInputAction.done,
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
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              profilePro
                  .updateBankDetail(
                      bank_name: nameCtrl.text.toString(),
                      branch_name: branchCtrl.text.toString(),
                      account_type: selectedVal.toString(),
                      micr_code: micrrl.text.toString(),
                      bank_address: addrCtrl.text.toString(),
                      account_number: accNoCtrl.text.toString(),
                      ifsc_code: ifscCtrl.text.toString())
                  .then(
                    (value) => Fluttertoast.showToast(
                      msg: value['msg'],
                      backgroundColor: colors.buttonColor,
                      textColor: Colors.white,
                      gravity: ToastGravity.BOTTOM,
                    ),
                  );
              Navigator.pop(context);
              Navigator.pop(context);
            }
          },
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
