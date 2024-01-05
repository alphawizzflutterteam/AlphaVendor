import 'package:alpha_work/Model/vendorProfileModel.dart';
import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/ViewModel/profileViewModel.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class EditAddressDetailScreen extends StatefulWidget {
  final VendorData vendorData;

  EditAddressDetailScreen({super.key, required this.vendorData});

  @override
  State<EditAddressDetailScreen> createState() =>
      _EditAddressDetailScreenState();
}

class _EditAddressDetailScreenState extends State<EditAddressDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController addressCtrl = TextEditingController();
  final TextEditingController cityCtrl = TextEditingController();
  final TextEditingController stateCtrl = TextEditingController();
  final TextEditingController zipCtrl = TextEditingController();
  final TextEditingController AddressCtrl = TextEditingController();
  final TextEditingController countryCtrl = TextEditingController();
  late ProfileViewModel profilePro;
  @override
  void initState() {
    addressCtrl.text = widget.vendorData.shop!.address.toString();
    cityCtrl.text = widget.vendorData.shop!.city.toString();
    stateCtrl.text = widget.vendorData.shop!.state.toString();
    zipCtrl.text = widget.vendorData.shop!.pincode.toString();
    countryCtrl.text = widget.vendorData.shop!.country.toString();
    profilePro = Provider.of<ProfileViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommanAppbar(appbarTitle: "Address Information"),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: addressCtrl,
                  textInputAction: TextInputAction.next,
                  decoration: (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(labelText: "Business Address*"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Business Address";
                    }
                    return null;
                  },
                ),
                const Divider(color: Colors.transparent),
                TextFormField(
                  controller: cityCtrl,
                  textInputAction: TextInputAction.next,
                  decoration: (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(labelText: "City*"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter City*";
                    }
                    return null;
                  },
                ),
                const Divider(color: Colors.transparent),
                TextFormField(
                  controller: stateCtrl,
                  textInputAction: TextInputAction.next,
                  decoration: (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(labelText: "State/Province*"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter State/Province*";
                    }
                    return null;
                  },
                ),
                const Divider(color: Colors.transparent),
                TextFormField(
                  controller: zipCtrl,
                  textInputAction: TextInputAction.next,
                  decoration: (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(labelText: "Postal/ZIP Code*"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Postal/ZIP Code";
                    }
                    return null;
                  },
                ),
                const Divider(color: Colors.transparent),
                TextFormField(
                  controller: countryCtrl,
                  textInputAction: TextInputAction.done,
                  decoration: (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(labelText: "Country*"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Country";
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
                  .updateAddressDetail(
                    address: addressCtrl.text.toString(),
                    country: countryCtrl.text.toString(),
                    state: stateCtrl.text.toString(),
                    city: cityCtrl.text.toString(),
                    pincode: zipCtrl.text.toString(),
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
