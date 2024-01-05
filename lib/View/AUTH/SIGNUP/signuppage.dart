import 'package:alpha_work/Utils/images.dart';
import 'package:alpha_work/Utils/shared_pref..dart';
import 'package:alpha_work/View/AUTH/LOGIN/loginpage.dart';
import 'package:alpha_work/ViewModel/authViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'package:easy_stepper/easy_stepper.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../../Utils/color.dart';

import '../../../Widget/CommonTextFromWidget/commontextform.dart';
import '../../../Widget/CommonTextWidget/commontext.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';

//  import 'package:flutter_gen/l10n/app_localizations.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Dashboard/Dashboad.dart';
import 'signupservice.dart';

// import 'package:/flutter_gen';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int currentprogressstep = 1;
  bool isChecked = false;
  var activeStep = 0;
  final _formKey = GlobalKey<FormState>();
  String? selectedValue;
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController pass1 = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController referalcodecontroller = TextEditingController();

  TextEditingController businesemail = TextEditingController();
  TextEditingController businesphoneNo = TextEditingController();
  TextEditingController busineType = TextEditingController();
  TextEditingController companyname = TextEditingController();
  TextEditingController businesRegNo = TextEditingController();
  TextEditingController businesGSTNIN = TextEditingController();
  TextEditingController businesTaxIDNM = TextEditingController();
  TextEditingController businesWebsite = TextEditingController();
  TextEditingController passwordsetup = TextEditingController();
  TextEditingController cnfrmPassword = TextEditingController();

  //for address information
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController citynamecontroller = TextEditingController();
  TextEditingController statacontroler = TextEditingController();
  TextEditingController postalcodecontroller = TextEditingController();
  TextEditingController countryController = TextEditingController();

  // for banking information
  TextEditingController banknamecontroller = TextEditingController();
  TextEditingController bankbranchcontroller = TextEditingController();
  TextEditingController accounttypecontroller = TextEditingController();
  TextEditingController micrController = TextEditingController();
  TextEditingController bankaddresscontroler = TextEditingController();
  TextEditingController accountcontroller = TextEditingController();
  TextEditingController ifsccontroller = TextEditingController();
  bool visibility = true;
  bool visibility1 = true;
  List<DropdownMenuItem> items = [
    DropdownMenuItem(
        child: Text(
          "Saving Account",
          style:
              TextStyle(color: colors.greyText, fontWeight: FontWeight.normal),
        ),
        value: "Saving Account"),
    DropdownMenuItem(
        child: Text(
          "Current Account",
          style:
              TextStyle(color: colors.greyText, fontWeight: FontWeight.normal),
        ),
        value: "Current Account"),
  ];
  late AuthViewModel auth;
  late String savedotp;
  void getOtp() async {
    savedotp = PreferenceUtils.getString(PrefKeys.otp);
    print(savedotp);

    setState(() {
      pinCtrl.text = savedotp;
    });
  }

  @override
  void initState() {
    auth = Provider.of<AuthViewModel>(context, listen: false);
    super.initState();
  }

  final defaultPinTheme = PinTheme(
    margin: const EdgeInsets.symmetric(horizontal: 15),
    textStyle: TextStyle(
        fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(
        color: const Color.fromARGB(255, 19, 88, 130),
      ),
      borderRadius: BorderRadius.circular(10),
    ),
  );
  final focusedPinTheme = PinTheme(
    textStyle: TextStyle(
        fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(
        color: const Color.fromARGB(255, 19, 88, 130),
      ),
      borderRadius: BorderRadius.circular(10),
    ),
  );
  TextEditingController pinCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.signInToYourAccount),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            if (activeStep != 0) {
              setState(() {
                activeStep--;
              });
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StepProgressIndicator(
                totalSteps: 6,
                currentStep: activeStep,
                size: 3,
                padding: 0,
                selectedColor: Colors.black,
                unselectedColor: Colors.grey,
                roundedEdges: const Radius.circular(10),
              ),
              Divider(color: Colors.transparent, height: height * .05),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (activeStep == 0)
                        Container(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Create your account",
                                  style: TextStyle(fontSize: 28),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                const Text(
                                  "Join us today and unlock exclusive benefits by creating your account now.",
                                  style: TextStyle(
                                    color: colors.greyText,
                                  ),
                                ),
                                SizedBox(
                                  height: height * .05,
                                ),
                                TextFormField(
                                  controller: mobilecontroller,
                                  decoration: InputDecoration()
                                      .applyDefaults(Theme.of(context)
                                          .inputDecorationTheme)
                                      .copyWith(
                                        label: Text("Mobile No."),
                                        counterText: '',
                                      ),
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length < 10) {
                                      return "Enter a valid number";
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  maxLength: 10,
                                  onChanged: (value) {
                                    if (value.length == 10) {
                                      FocusScope.of(context).unfocus();
                                    }
                                  },
                                ),
                                Divider(color: Colors.transparent),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      value: isChecked,
                                      activeColor: colors.buttonColor,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      },
                                    ),
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "By Continue, you agree to our",
                                          style: TextStyle(),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Term of Services",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 16, 89, 132),
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text("&"),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              "Privacy Policy",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 16, 89, 132),
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Divider(color: Colors.transparent),
                                GestureDetector(
                                  onTap: isChecked
                                      ? () {
                                          if (_formKey.currentState!
                                                  .validate() &&
                                              isChecked) {
                                            print(mobilecontroller.text);
                                            auth
                                                .getRegistrarionOtp(
                                                    phone: mobilecontroller.text
                                                        .toString())
                                                .then((value) {
                                              if (value) {
                                                getOtp();
                                                setState(() {
                                                  activeStep++;
                                                });
                                              }
                                            });
                                          }
                                        }
                                      : null,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      // width: MediaQuery.of(context).size.width - 100,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: isChecked
                                            ? const Color(0xFF0A9494)
                                            : colors.greyText,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "VERIFY",
                                            style: TextStyle(
                                                color: isChecked
                                                    ? Colors.white
                                                    : colors.lightTextColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (activeStep == 1)
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(color: Colors.transparent),
                              const Text(
                                "Enter Verification Code",
                                style: TextStyle(fontSize: 22),
                              ),
                              Text(
                                "Enter the otp sent to ${mobilecontroller.text.toString()}",
                                style: TextStyle(
                                    fontSize: 14, color: colors.greyText),
                              ),
                              Divider(
                                  color: Colors.transparent,
                                  height: height * .05),
                              Pinput(
                                defaultPinTheme: defaultPinTheme.copyWith(
                                  width: width * .2,
                                  height: 50,
                                ),
                                focusedPinTheme: focusedPinTheme.copyWith(
                                  width: width * .2,
                                  height: 50,
                                ),
                                length: 4,
                                controller: pinCtrl,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (pinCtrl.text == savedotp) {
                                    setState(() {
                                      activeStep += 1;
                                    });
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "OTP did not match!",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: colors.buttonColor,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width - 80,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF0A9494),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "VERIFY",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  height: 50,
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Didn`t receaved Otp? ",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        "Resend OTP",
                                        style: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 29, 104, 136),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (activeStep == 2)
                        Container(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SignupHeadingText(
                                  text: 'Enter personal detail',
                                ),
                                const Text(
                                  "Enter your personal details to create an account and unlock a world of possibilities",
                                  style: TextStyle(color: colors.greyText),
                                ),
                                SizedBox(height: height * .04),
                                TextFormField(
                                  controller: namecontroller,
                                  keyboardType: TextInputType.name,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter your name";
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration()
                                      .applyDefaults(Theme.of(context)
                                          .inputDecorationTheme)
                                      .copyWith(
                                        labelText: "Full Name*",
                                      ),
                                ),
                                const Divider(color: Colors.transparent),
                                TextFormField(
                                  controller: emailcontroller,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration()
                                      .applyDefaults(Theme.of(context)
                                          .inputDecorationTheme)
                                      .copyWith(
                                        labelText: "Email ID*",
                                      ),
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter your Email";
                                    }
                                    return null;
                                  },
                                ),
                                const Divider(color: Colors.transparent),
                                TextFormField(
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter your phone";
                                    }
                                    return null;
                                  },
                                  maxLength: 10,
                                  keyboardType: TextInputType.phone,
                                  controller: mobilecontroller,
                                  decoration: InputDecoration()
                                      .applyDefaults(Theme.of(context)
                                          .inputDecorationTheme)
                                      .copyWith(
                                          labelText: "Phone Number*",
                                          counterText: ""),
                                ),
                                const Divider(color: Colors.transparent),
                                TextFormField(
                                  keyboardType: TextInputType.phone,
                                  controller: referalcodecontroller,
                                  decoration: InputDecoration()
                                      .applyDefaults(Theme.of(context)
                                          .inputDecorationTheme)
                                      .copyWith(
                                        labelText: "Referral Code (Optional)",
                                      ),
                                ),
                                Divider(
                                  color: Colors.transparent,
                                  height: height * .1,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        activeStep += 1;
                                      });
                                    }
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      // width: MediaQuery.of(context).size.width - 100,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF0A9494),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "CONTINUE",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (activeStep == 3)
                        Container(
                          child: Form(
                              key: _formKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SignupHeadingText(
                                      text: 'Enter your Business detail',
                                    ),
                                    const Text(
                                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s ',
                                      style: TextStyle(color: colors.greyText),
                                    ),
                                    const Divider(color: Colors.transparent),
                                    TextFormField(
                                      controller: businesemail,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration()
                                          .applyDefaults(Theme.of(context)
                                              .inputDecorationTheme)
                                          .copyWith(
                                            labelText: "Email ID*",
                                          ),
                                      textInputAction: TextInputAction.next,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Enter your Email";
                                        }
                                        return null;
                                      },
                                    ),
                                    const Divider(color: Colors.transparent),
                                    TextFormField(
                                      textInputAction: TextInputAction.next,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Enter your phone";
                                        }
                                        return null;
                                      },
                                      maxLength: 10,
                                      keyboardType: TextInputType.phone,
                                      controller: businesphoneNo,
                                      decoration: InputDecoration()
                                          .applyDefaults(Theme.of(context)
                                              .inputDecorationTheme)
                                          .copyWith(
                                              labelText: "Phone Number*",
                                              counterText: ""),
                                    ),
                                    const Divider(color: Colors.transparent),
                                    TextFormField(
                                      controller: companyname,
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration()
                                          .applyDefaults(Theme.of(context)
                                              .inputDecorationTheme)
                                          .copyWith(
                                            labelText:
                                                "Company or Business Name*",
                                          ),
                                      textInputAction: TextInputAction.next,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Enter business name";
                                        }
                                        return null;
                                      },
                                    ),
                                    const Divider(color: Colors.transparent),
                                    TextFormField(
                                      controller: busineType,
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration()
                                          .applyDefaults(Theme.of(context)
                                              .inputDecorationTheme)
                                          .copyWith(
                                            labelText: "Business Type*",
                                          ),
                                      textInputAction: TextInputAction.next,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Enter business type";
                                        }
                                        return null;
                                      },
                                    ),
                                    const Divider(color: Colors.transparent),
                                    TextFormField(
                                      controller: businesRegNo,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration()
                                          .applyDefaults(Theme.of(context)
                                              .inputDecorationTheme)
                                          .copyWith(
                                            labelText:
                                                "Registration Number (if applicable)",
                                          ),
                                      textInputAction: TextInputAction.next,
                                    ),
                                    const Divider(color: Colors.transparent),
                                    TextFormField(
                                      controller: businesGSTNIN,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration()
                                          .applyDefaults(Theme.of(context)
                                              .inputDecorationTheme)
                                          .copyWith(
                                            labelText: "GSTIN (Optional)",
                                          ),
                                      textInputAction: TextInputAction.next,
                                    ),
                                    const Divider(color: Colors.transparent),
                                    TextFormField(
                                      controller: businesTaxIDNM,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration()
                                          .applyDefaults(Theme.of(context)
                                              .inputDecorationTheme)
                                          .copyWith(
                                            labelText:
                                                "Tax Identification Number (TIN)*",
                                          ),
                                      textInputAction: TextInputAction.next,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Enter Tax Identification Number (TIN)*";
                                        }
                                        return null;
                                      },
                                    ),
                                    const Divider(color: Colors.transparent),
                                    TextFormField(
                                      controller: null,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration()
                                          .applyDefaults(Theme.of(context)
                                              .inputDecorationTheme)
                                          .copyWith(
                                            labelText: "Website  (Optional)",
                                          ),
                                      textInputAction: TextInputAction.done,
                                    ),
                                    Divider(color: Colors.transparent),
                                    GestureDetector(
                                      onTap: () {
                                        if (_formKey.currentState!.validate()) {
                                          setState(() {
                                            activeStep += 1;
                                          });
                                        }
                                      },
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          // width: MediaQuery.of(context).size.width - 100,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF0A9494),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "CONTINUE",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      if (activeStep == 4)
                        Container(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SignupHeadingText(
                                  text: 'Enter new Password',
                                ),
                                const Text(
                                  "Set your password your new password so you can access alpha e-commerce",
                                  style: TextStyle(color: colors.greyText),
                                ),
                                SizedBox(
                                  height: height * .07,
                                ),
                                TextFormField(
                                  controller: pass,
                                  decoration: InputDecoration()
                                      .applyDefaults(Theme.of(context)
                                          .inputDecorationTheme)
                                      .copyWith(
                                          label: Text("New Password"),
                                          suffixIcon: GestureDetector(
                                            onTap: () => setState(() {
                                              visibility = !visibility;
                                              print("object");
                                            }),
                                            child: Icon(
                                              visibility
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: Colors.black,
                                            ),
                                          )),
                                  keyboardType: TextInputType.emailAddress,
                                  obscureText: visibility,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter password";
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.next,
                                ),
                                const Divider(color: Colors.transparent),
                                TextFormField(
                                  controller: pass1,
                                  decoration: InputDecoration()
                                      .applyDefaults(Theme.of(context)
                                          .inputDecorationTheme)
                                      .copyWith(
                                          label: Text("Confirm Password"),
                                          suffixIcon: GestureDetector(
                                            onTap: () => setState(() {
                                              visibility1 = !visibility1;
                                              print("object");
                                            }),
                                            child: Icon(
                                              visibility1
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: Colors.black,
                                            ),
                                          )),
                                  keyboardType: TextInputType.emailAddress,
                                  obscureText: visibility1,
                                  textInputAction: TextInputAction.done,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter password";
                                    }
                                    return null;
                                  },
                                ),
                                Divider(
                                  color: Colors.transparent,
                                  height: height * .07,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      if (pass.text == pass1.text) {
                                        setState(() {
                                          activeStep += 1;
                                        });
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: "Password did not match!",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: colors.buttonColor,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      }
                                    }
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF0A9494),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Center(
                                        child: Text(
                                      "CREATE PASSWORD",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      if (activeStep == 5)
                        Container(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SignupHeadingText(
                                  text: 'Enter Your Address Information',
                                ),
                                const Text(
                                  'Unlock exclusive access! Complete your signup by adding your address details.',
                                  style: TextStyle(color: colors.greyText),
                                ),
                                SizedBox(
                                  height: height * .05,
                                ),
                                TextFormField(
                                  controller: addresscontroller,
                                  decoration: (const InputDecoration())
                                      .applyDefaults(Theme.of(context)
                                          .inputDecorationTheme)
                                      .copyWith(labelText: "Address*"),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter Address";
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.next,
                                ),
                                const Divider(color: Colors.transparent),
                                TextFormField(
                                  controller: citynamecontroller,
                                  textInputAction: TextInputAction.next,
                                  decoration: (const InputDecoration())
                                      .applyDefaults(Theme.of(context)
                                          .inputDecorationTheme)
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
                                  controller: statacontroler,
                                  textInputAction: TextInputAction.next,
                                  decoration: (const InputDecoration())
                                      .applyDefaults(Theme.of(context)
                                          .inputDecorationTheme)
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
                                  controller: postalcodecontroller,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  decoration: (const InputDecoration())
                                      .applyDefaults(Theme.of(context)
                                          .inputDecorationTheme)
                                      .copyWith(
                                        labelText: "Postal/ZIP Code*",
                                        counterText: "",
                                      ),
                                  maxLength: 6,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter Postal/ZIP Code";
                                    }
                                    return null;
                                  },
                                ),
                                const Divider(color: Colors.transparent),
                                TextFormField(
                                  controller: countryController,
                                  textInputAction: TextInputAction.done,
                                  decoration: (const InputDecoration())
                                      .applyDefaults(Theme.of(context)
                                          .inputDecorationTheme)
                                      .copyWith(labelText: "Country*"),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter Country";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: height * .07),
                                GestureDetector(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        activeStep += 1;
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF0A9494),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Center(
                                        child: Text(
                                      "CONTINUE",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      if (activeStep == 6)
                        Container(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SignupHeadingText(
                                  text: 'Enter Your banking Information',
                                ),
                                const Text(
                                  "Enter your banking information to get started and manage your finances hassle-free.",
                                  style: TextStyle(color: colors.greyText),
                                ),
                                SizedBox(
                                  height: height * .05,
                                ),
                                TextFormField(
                                  textInputAction: TextInputAction.next,
                                  controller: banknamecontroller,
                                  decoration: (const InputDecoration())
                                      .applyDefaults(Theme.of(context)
                                          .inputDecorationTheme)
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
                                  textInputAction: TextInputAction.next,
                                  controller: bankbranchcontroller,
                                  decoration: (const InputDecoration())
                                      .applyDefaults(Theme.of(context)
                                          .inputDecorationTheme)
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
                                        .applyDefaults(Theme.of(context)
                                            .inputDecorationTheme)
                                        .copyWith(
                                            contentPadding:
                                                EdgeInsets.only(right: 10)),
                                    hint: Text("Account Type*",
                                        style: TextStyle(
                                            color: colors.greyText,
                                            fontWeight: FontWeight.normal)),
                                    value: selectedValue,
                                    onChanged: (value) {
                                      selectedValue = value;
                                    },
                                    items: items),
                                const Divider(color: Colors.transparent),
                                TextFormField(
                                  textCapitalization:
                                      TextCapitalization.characters,
                                  controller: micrController,
                                  textInputAction: TextInputAction.next,
                                  decoration: (const InputDecoration())
                                      .applyDefaults(Theme.of(context)
                                          .inputDecorationTheme)
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
                                  textInputAction: TextInputAction.next,
                                  controller: bankaddresscontroler,
                                  decoration: (const InputDecoration())
                                      .applyDefaults(Theme.of(context)
                                          .inputDecorationTheme)
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
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  controller: accountcontroller,
                                  decoration: (const InputDecoration())
                                      .applyDefaults(Theme.of(context)
                                          .inputDecorationTheme)
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
                                  textCapitalization:
                                      TextCapitalization.characters,
                                  controller: ifsccontroller,
                                  textInputAction: TextInputAction.done,
                                  decoration: (const InputDecoration())
                                      .applyDefaults(Theme.of(context)
                                          .inputDecorationTheme)
                                      .copyWith(labelText: "IFSC Code*"),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter IFSC Code";
                                    }
                                    return null;
                                  },
                                ),
                                const Divider(color: Colors.transparent),
                                GestureDetector(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      print(savedotp);
                                      print(namecontroller.text);
                                      print(emailcontroller.text);
                                      print(mobilecontroller.text);
                                      print(referalcodecontroller.text);
                                      print(businesemail.text);
                                      print(businesphoneNo.text);
                                      print(companyname.text);
                                      print(busineType.text);
                                      print(businesRegNo.text);
                                      print(businesGSTNIN.text);
                                      print(businesTaxIDNM.text);
                                      print(businesWebsite.text);
                                      print(pass.text);
                                      print(pass1.text);
                                      print(addresscontroller.text);
                                      print(citynamecontroller.text);
                                      print(statacontroler.text);
                                      print(postalcodecontroller.text);
                                      print(countryController.text);
                                      print(banknamecontroller.text);
                                      print(bankbranchcontroller.text);
                                      print(selectedValue);
                                      print(micrController.text);
                                      print(bankaddresscontroler.text);
                                      print(accountcontroller.text);
                                      print(ifsccontroller.text);
                                      auth
                                          .registerUser(
                                        phone: mobilecontroller.text.toString(),
                                        otp: savedotp.toString(),
                                        name: namecontroller.text.toString(),
                                        email: emailcontroller.text.toString(),
                                        referalcode: referalcodecontroller.text
                                            .toString(),
                                        businessemail:
                                            businesemail.text.toString(),
                                        businessphoneNo:
                                            businesphoneNo.text.toString(),
                                        businessname:
                                            companyname.text.toString(),
                                        businessType:
                                            busineType.text.toString(),
                                        registrationNo:
                                            businesRegNo.text.toString(),
                                        gstin: businesGSTNIN.text.toString(),
                                        tin: businesGSTNIN.text.toString(),
                                        website: businesWebsite.text.toString(),
                                        password: pass.text.toString(),
                                        confirmPass: pass1.text.toString(),
                                        addr: addresscontroller.text.toString(),
                                        city:
                                            citynamecontroller.text.toString(),
                                        state: statacontroler.text.toString(),
                                        zip: postalcodecontroller.text
                                            .toString(),
                                        country:
                                            countryController.text.toString(),
                                        bankName:
                                            banknamecontroller.text.toString(),
                                        branch: bankbranchcontroller.text
                                            .toString(),
                                        accType: selectedValue.toString(),
                                        micr: micrController.text.toString(),
                                        bankAddr: bankaddresscontroler.text
                                            .toString(),
                                        accNo:
                                            accountcontroller.text.toString(),
                                        ifsc: ifsccontroller.text.toString(),
                                      )
                                          .then((value) {
                                        if (value) {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              Future.delayed(
                                                  Duration(seconds: 5), () {
                                                Navigator.of(context).pop(true);
                                                Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginPage(),
                                                    ),
                                                    (route) => false);
                                              });
                                              return RegistrationSuccessDialog(
                                                  context);
                                            },
                                          );
                                        } else {
                                          Fluttertoast.showToast(
                                            msg:
                                                "Something went wrong! Please try again.",
                                            backgroundColor: colors.buttonColor,
                                            gravity: ToastGravity.BOTTOM,
                                            textColor: Colors.white,
                                            fontSize: 14,
                                          );
                                        }
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF0A9494),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Center(
                                        child: Text(
                                      "FINISH",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

RegistrationSuccessDialog(BuildContext context) {
  return Material(
    child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Images.success_bg), fit: BoxFit.fill)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            Images.success_check,
            height: 100,
            width: 100,
          ),
          Divider(color: Colors.transparent),
          Center(
            child: Text(
              "Request successfully send to admin",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          Divider(color: Colors.transparent),
          Center(
            child: Text(
              "Please wait for confirmation",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          )
        ],
      ),
    ),
  );
}
