import 'package:alpha_work/Utils/appUrls.dart';
import 'package:alpha_work/Utils/images.dart';
import 'package:alpha_work/Utils/shared_pref..dart';
import 'package:alpha_work/ViewModel/authViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:page_transition/page_transition.dart';
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(Images.onboardingBg_light),
          AppBar(
            toolbarHeight: kToolbarHeight,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_new_rounded),
            ),
            title: Text("Verify Number"),
            centerTitle: true,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Spacer(),
                Image.asset(width: 60, Images.alphalogo_light),
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
                      PreferenceUtils.setString(PrefKeys.isLoggedIn, "true");
                      Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                              child: const DashboardScreen1(),
                              type: PageTransitionType.rightToLeft),
                          (route) => false);
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
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 29, 104, 136),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
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
            