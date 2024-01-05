import 'package:alpha_work/Model/vendorProfileModel.dart';
import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/View/Product/model/categoryModel.dart';
import 'package:alpha_work/ViewModel/profileViewModel.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class EditBusinessDetailScreen extends StatefulWidget {
  final VendorData vendorData;

  EditBusinessDetailScreen({super.key, required this.vendorData});

  @override
  State<EditBusinessDetailScreen> createState() =>
      _EditBusinessDetailScreenState();
}

class _EditBusinessDetailScreenState extends State<EditBusinessDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController typeCtrl = TextEditingController();
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController gstinCtrl = TextEditingController();
  final TextEditingController regCtrl = TextEditingController();
  final TextEditingController tinCtrl = TextEditingController();
  late ProfileViewModel profilePro;
  @override
  void initState() {
    emailCtrl.text = widget.vendorData.shop!.email.toString();
    typeCtrl.text = widget.vendorData.shop!.bussinessType.toString();
    nameCtrl.text = widget.vendorData.bankName.toString();
    gstinCtrl.text = widget.vendorData.shop!.gstIn.toString();
    regCtrl.text = widget.vendorData.shop!.registerationNumber.toString();
    tinCtrl.text = widget.vendorData.shop!.taxIdentificationNumber.toString();
    profilePro = Provider.of<ProfileViewModel>(context, listen: false);
    super.initState();
  }

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
                  controller: emailCtrl,
                  textInputAction: TextInputAction.next,
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
                TextFormField(
                  controller: typeCtrl,
                  textInputAction: TextInputAction.next,
                  decoration: (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(labelText: "Business Type*"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter businesss type";
                    }
                    return null;
                  },
                ),
                const Divider(color: Colors.transparent),
                TextFormField(
                  controller: nameCtrl,
                  textInputAction: TextInputAction.next,
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
                  controller: gstinCtrl,
                  textInputAction: TextInputAction.next,
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
                  controller: regCtrl,
                  textInputAction: TextInputAction.next,
                  decoration: (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(
                          labelText:
                              "Business Registration Number (if applicable)"),
                ),
                const Divider(color: Colors.transparent),
                TextFormField(
                  controller: tinCtrl,
                  textInputAction: TextInputAction.done,
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
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              profilePro
                  .updateBusinessDetail(
                    bussiness_email_id: emailCtrl.text.toString(),
                    bussiness_type: typeCtrl.text.toString(),
                    company_name: nameCtrl.text.toString(),
                    gst_in: gstinCtrl.text.toString(),
                    bussiness_registeration_number: regCtrl.text.toString(),
                    tax_identification_number: tinCtrl.text.toString(),
                  )
                  .then(
                    (value) => Fluttertoast.showToast(
                      msg: value['msg'],
                      backgroundColor: colors.buttonColor,
                      textColor: Colors.white,
                      gravity: ToastGravity.BOTTOM,
                    ),
                  );
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
