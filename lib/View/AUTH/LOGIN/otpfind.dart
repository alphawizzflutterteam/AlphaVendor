import 'package:alpha_work/Utils/appUrls.dart';
import 'package:alpha_work/Utils/shared_pref..dart';
import 'package:alpha_work/ViewModel/authViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Dashboard/Dashboad.dart';

class OtpCheckPage extends StatefulWidget {
  @override
  State<OtpCheckPage> createState() => _OtpCheckPageState();
}

class _OtpCheckPageState extends State<OtpCheckPage> {
  TextEditingController pinCtrl = TextEditingController();
  var savedotp;
  void getOtp() async {
    savedotp = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    print(savedotp);

    setState(() {
      pinCtrl.text = savedotp;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getOtp();

    super.initState();
  }

  final defaultPinTheme = PinTheme(
    width: 50,
    height: 50,
    margin: const EdgeInsets.symmetric(horizontal: 15),
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(
        color: const Color.fromARGB(255, 19, 88, 130),
      ),
      borderRadius: BorderRadius.circular(10),
    ),
  );
  final focusedPinTheme = PinTheme(
    width: 50,
    height: 50,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(
        color: const Color.fromARGB(255, 19, 88, 130),
      ),
      borderRadius: BorderRadius.circular(10),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        title: const Text("Verify Number"),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              Align(
                  // logo_with_greenTop
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                      width: 60, "assets/images/logo_with_greenTop.png")),
              const Text(
                "Enter Verification Code",
                style: TextStyle(fontSize: 22),
              ),
              // const Text("Enter the otp sent to +916266"),
              Divider(
                color: Colors.transparent,
                height: 30,
              ),
              Center(
                child: Pinput(
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  length: 4,
                  controller: pinCtrl,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  if (pinCtrl.text == savedotp) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardScreen1(),
                      ),
                    );
                  }
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 100,
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
                              color: Colors.white, fontWeight: FontWeight.bold),
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
                          fontWeight: FontWeight.bold,
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
    );
  }
}


// OtpTextField(
//                   autoFocus: true,
//                   fieldWidth: 50,
//                   numberOfFields: 4,
//                   borderColor: const Color.fromARGB(255, 19, 88, 130),
//                   //set to true to show as box or false to show as dash
//                   showFieldAsBox: true,

//                   //runs when a code is typed in
//                   onCodeChanged: (String code) {
//                     code = otp;
//                   },
//                   //runs when every textfield is filled
//                   onSubmit: (String verificationCode) {
//                     showDialog(
//                         context: context,
//                         builder: (context) {
//                           return AlertDialog(
//                             title: const Text("Verification Code"),
//                             content: Text('Code entered is $verificationCode'),
//                           );
//                         });
//                   }, // end onSubmit
//                 ),
            