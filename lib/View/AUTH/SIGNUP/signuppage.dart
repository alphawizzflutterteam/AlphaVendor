import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
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
  final _currentStep = 1;
  var activeStep = 0;
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;
  TextEditingController mobilecontroller = TextEditingController();

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  // TextEditingController mo = TextEditingController();
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

// var
  var _getCountry = [];
  var _getState = [];
  var _getCity = [];
  var _countryname;
  var _statename;
  var _cityyname;

  // for banking information
  TextEditingController banknamecontroller = TextEditingController();
  TextEditingController bankbranchcontroller = TextEditingController();
  TextEditingController accounttypecontroller = TextEditingController();
  TextEditingController micrController = TextEditingController();
  TextEditingController bankaddresscontroler = TextEditingController();
  TextEditingController accountcontroller = TextEditingController();
  TextEditingController ifsccontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetCounty();
  }

  GetCounty() {
    final service = SignupService();
    service.GetCountryList().then((value) {
      setState(() {
        print("My Cintry");
        print(value['data']);
        _getCountry = value['data'];
      });
    });
  }

  GetState() {
    final service = SignupService();
    service.GetState(_countryname).then((value) {
      setState(() {
        print("My state");
        print(value['data']);
        _getState = value['data'];
      });
    });
  }

  GetCity() {
    final service = SignupService();
    service.GetCity(_statename).then((value) {
      setState(() {
        // print("My Cintry");
        // print(value['data']);
        _getCity = value['data'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.signInToYourAccount),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StepProgressIndicator(
                  totalSteps: 6,
                  currentStep: activeStep,
                  size: 3,
                  padding: 0,
                  selectedColor: const Color.fromARGB(255, 6, 71, 125),
                  unselectedColor: Colors.grey,
                  roundedEdges: const Radius.circular(10),
                ),
                const SizedBox(
                  height: 30,
                ),
                if (activeStep == 0)
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Create your account",
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                            "Lorem ipsum is typically a corrupted version of De finibus bonorum et malorum, a 1st-century BC text by the Roman statesman "),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(border: Border.all()),
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 10) {
                                FocusScope.of(context).unfocus();
                              }
                            },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            keyboardType: TextInputType.number,
                            controller: mobilecontroller,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.mobile_friendly),
                                hintText: '+91..',
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.black),
                                ),
                                label: Text(" Enter Mobile Number")),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                          color:
                                              Color.fromARGB(255, 16, 89, 132),
                                          decoration: TextDecoration.underline),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text("&"),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      "Privecy Policy",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 16, 89, 132),
                                          decoration: TextDecoration.underline),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              activeStep += 1;
                            });
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
                                mainAxisAlignment: MainAxisAlignment.center,
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
                      ],
                    ),
                  ),
                if (activeStep == 1)
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Enter Verification Code",
                            style: TextStyle(fontSize: 22),
                          ),
                          const Text("Enter the otp sent to +916266"),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: OtpTextField(
                              autoFocus: true,
                              fieldWidth: 70,
                              borderRadius: BorderRadius.circular(10),
                              numberOfFields: 4,
                              borderColor:
                                  const Color.fromARGB(255, 19, 88, 130),
                              //set to true to show as box or false to show as dash
                              showFieldAsBox: true,
                              //runs when a code is typed in
                              onCodeChanged: (String code) {
                                //handle validation or checks here
                              },
                              //runs when every textfield is filled
                              onSubmit: (String verificationCode) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Verification Code"),
                                        content: Text(
                                            'Code entered is $verificationCode'),
                                      );
                                    });
                              }, // end onSubmit
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                activeStep += 1;
                              });
                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: MediaQuery.of(context).size.width - 80,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF0A9494),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                              width: MediaQuery.of(context).size.width - 100,
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
                                      color: Color.fromARGB(255, 29, 104, 136),
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
                if (activeStep == 2)
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SignupHeadingText(
                            text: 'Enter personal detail',
                          ),
                          const Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s '),
                          const SizedBox(
                            height: 20,
                          ),
                          Form(
                              child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  child: TextFormField(
                                    onChanged: (value) {
                                      if (value.length == 10) {
                                        // FocusScope.of(context).unfocus();
                                      }
                                    },
                                    controller: namecontroller,
                                    decoration: InputDecoration(
                                      labelText: "Full Name*",
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    child: TextFormField(
                                  onChanged: (value) {
                                    if (value.length == 10) {
                                      // FocusScope.of(context).unfocus();
                                    }
                                  },
                                  controller: emailcontroller,
                                  decoration: InputDecoration(
                                    labelText: "Personal Email Id*",
                                    labelStyle: const TextStyle(
                                        color: colors.lightTextColor),
                                    fillColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: TextField(
                                      onChanged: (value) {
                                        if (value.length == 10) {
                                          FocusScope.of(context).unfocus();
                                        }
                                      },
                                      keyboardType: TextInputType.phone,
                                      controller: mobilecontroller,
                                      decoration: InputDecoration(
                                        labelText: "Personal Phone Number*",
                                        fillColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: const BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: const BorderSide(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                      )),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: TextField(
                                      onChanged: (value) {
                                        if (value.length == 10) {
                                          FocusScope.of(context).unfocus();
                                        }
                                      },
                                      keyboardType: TextInputType.phone,
                                      controller: referalcodecontroller,
                                      decoration: InputDecoration(
                                        labelText: "Referall Code*",
                                        fillColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: const BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: const BorderSide(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                      )),
                                ),
                                const SizedBox(
                                  height: 80,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      activeStep += 1;
                                    });
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
                          )),
                        ],
                      ),
                    ),
                  ),
                if (activeStep == 3)
                  Container(
                    child: Form(
                        child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SignupHeadingText(
                            text: 'Enter your detail',
                          ),
                          const Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s '),
                          const SizedBox(
                            height: 20,
                          ),
                          CommonTextForm(
                            controllername: businesemail,
                            labelname: 'Enter Business Email ID*',
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CommonTextForm(
                            controllername: businesphoneNo,
                            labelname: 'Business Phone No*',
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all()),
                            child: ListTile(
                              // title: const Text("Business Type*"),
                              subtitle: DropdownButton2(
                                isExpanded: true,
                                hint: const Row(
                                  children: [
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Business Type*',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                items: items
                                    .map((String item) => DropdownMenuItem(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                                value: selectedValue,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedValue = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CommonTextForm(
                            controllername: companyname,
                            labelname: 'Company Name Or Business Name*',
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CommonTextForm(
                            controllername: businesRegNo,
                            labelname:
                                'Business Registration Number(If applicable)*',
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CommonTextForm(
                            controllername: businesGSTNIN,
                            labelname: 'Enter GSTIN*',
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CommonTextForm(
                            controllername: businesTaxIDNM,
                            labelname: 'Tax Identification Number(TIN)*',
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CommonTextForm(
                            controllername: businesWebsite,
                            labelname: 'Website*',
                          ),
                        ],
                      ),
                    )),
                  ),

                //for password setup

                if (activeStep == 4)
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SignupHeadingText(
                          text: 'Enter new Password',
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                            "Set Your new password , So you can use for Login"),
                        const SizedBox(
                          height: 50,
                        ),
                        Form(
                            child: Column(
                          children: [
                            CommonPAssword(
                              controllername: passwordsetup,
                              labelname: 'Enter New Password',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CommonPAssword(
                              controllername: cnfrmPassword,
                              labelname: 'Confirm Password',
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                print("object");
                                setState(() {
                                  activeStep += 1;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF0A9494),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                      child: Text("CREATE PASSWORD")),
                                ),
                              ),
                            )
                          ],
                        ))
                      ],
                    ),
                  ),

                //for address information

                if (activeStep == 5)
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SignupHeadingText(
                          text: 'Enter Your Address Information',
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text('Lorem '),
                        const SizedBox(
                          height: 50,
                        ),
                        CommonTextForm(
                          controllername: addresscontroller,
                          labelname: 'Address*',
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: true,
                                hint: const Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Select Country*',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 16,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                items: _getCountry
                                    .map((item) => DropdownMenuItem(
                                          value: item['id'],
                                          onTap: () {},
                                          child: Text(
                                            item['name'],
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                            ),
                                            // overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                                value: _countryname,
                                onChanged: (value) {
                                  setState(() {
                                    _getState = [];
                                    _getCity = [];
                                    _statename = null;
                                    _cityyname = null;
                                    //  GetState();
                                    _countryname = value;

                                    GetState();
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: true,
                                hint: const Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Select State*',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 16,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                items: _getState
                                    .map((item) => DropdownMenuItem(
                                          value: item['id'],
                                          onTap: () {},
                                          child: Text(
                                            item['name'],
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                            ),
                                            // overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                                value: _statename,
                                onChanged: (value) {
                                  setState(() {
                                    _getCity = [];
                                    _cityyname = null;
                                    // GetState();

                                    _statename = value;
                                    GetCity();

                                    // GetState();
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: true,
                                hint: const Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Select City*',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 16,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                items: _getCity
                                    .map((item) => DropdownMenuItem(
                                          value: item['id'],
                                          onTap: () {},
                                          child: Text(
                                            item['name'],
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                            ),
                                            // overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                                value: _cityyname,
                                onChanged: (value) {
                                  setState(() {
                                    _cityyname = value;

                                    // GetState();
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        CommonTextForm(
                          controllername: postalcodecontroller,
                          labelname: 'Postal/ZIP Code*',
                        ),
                        const SizedBox(
                          height: 36,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("my data");
                            setState(() {
                              activeStep += 1;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF0A9494),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(child: Text("CONTINUE")),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                if (activeStep == 6)
                  Container(
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SignupHeadingText(
                            text: 'Enter Your banking Information',
                          ),
                          const Text("abc"),
                          const SizedBox(
                            height: 50,
                          ),
                          CommonTextForm(
                            controllername: banknamecontroller,
                            labelname: 'Bank Name*',
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          CommonTextForm(
                            controllername: bankbranchcontroller,
                            labelname: 'Bank Branch*',
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          CommonTextForm(
                            controllername: accounttypecontroller,
                            labelname: 'Account Type*',
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          CommonTextForm(
                            controllername: micrController,
                            labelname: 'MICR code*',
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          CommonTextForm(
                            controllername: bankaddresscontroler,
                            labelname: 'Bank Address*',
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          CommonTextForm(
                            controllername: accountcontroller,
                            labelname: 'Account Number*',
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          CommonTextForm(
                            controllername: ifsccontroller,
                            labelname: 'IFSC Code*',
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          GestureDetector(
                            onTap: () {
                              print("object");
                              setState(() {
                                // activeStep += 1;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const DashboardScreen1())));
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: const Color(0xFF0A9494),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(child: Text("FINISH")),
                              ),
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
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       currentprogressstep += 1;
      //       print(currentprogressstep);
      //     });
      //   },
      //   child: const Icon(Icons.abc),
      // ),

      bottomNavigationBar: activeStep == 3
          ? GestureDetector(
              onTap: () {
                print("object");
                setState(() {
                  activeStep += 1;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color(0xFF0A9494),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(child: Text("CONTINUE")),
                ),
              ),
            )
          : Container(
              height: 1,
            ),
    );
  }
}
