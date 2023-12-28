import 'package:alpha_work/ViewModel/authViewModel.dart';
import 'package:flutter/material.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:provider/provider.dart';

import '../../../Widget/CommonTextFromWidget/commontextform.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Dashboard/Dashboad.dart';
import '../SIGNUP/signuppage.dart';
import 'otpfind.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var tabstatus = 0;
  TextEditingController mobilenumbercontroller = TextEditingController();
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // decoration: const BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage("assets/images/success.png"))),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 150,
                ),
                Align(
                    // logo_with_greenTop
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                        width: 60, "assets/images/logo_with_greenTop.png")),
                Text(
                  AppLocalizations.of(context)!.signInToYourAccount,
                  style: const TextStyle(fontSize: 22),
                ),
                const Text("lorem inspire is most beautifu part of my life"),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  child: ContainedTabBarView(
                    tabs: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Text(AppLocalizations.of(context)!.loginViaPhone),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Text(AppLocalizations.of(context)!.loginviaEmail),
                      ),
                    ],
                    tabBarProperties: TabBarProperties(
                        width: MediaQuery.of(context).size.width,
                        background: Container(
                            decoration: const BoxDecoration(
                          color: Colors.transparent,
                          boxShadow: [
                            // BoxShadow(
                            //   blurRadius: 5.0, // shadow blur
                            //   color: Colors.white, // shadow color
                            //   offset: Offset(
                            //       1.0, 1.0), // how much shadow will be shown
                            // ),
                          ],
                        )),
                        padding: const EdgeInsets.symmetric(
                            // horizontal: 32.0,
                            // vertical: 8.0,
                            ),
                        indicator: ContainerTabIndicator(
                          width: 180,
                          height: 45,
                          radius: BorderRadius.circular(4.0),
                          color: const Color(0xFF0A9494).withOpacity(.2),
                        ),
                        labelColor: const Color.fromARGB(255, 29, 104, 136),
                        unselectedLabelColor: Colors.black),
                    views: [
                      _Views(),
                      _Views1(),
                    ],
                    onChange: (index) {
                      setState(() {
                        tabstatus = index;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const SignUpPage())));
        },
        child: const SizedBox(
            height: 50,
            child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don`t have an account?"),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Signup",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 29, 104, 136),
                          decoration: TextDecoration.underline),
                    )
                  ],
                ))),
      ),
    );
  }

  Widget _Views() {
    return Container(
      child: Form(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            CommonTextForm(
              controllername: mobilenumbercontroller,
              labelname: 'Mobile No',
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const OtpCheckPage())));
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF0A9494),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "LOGIN",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forget Password?",
                  style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ))
          ],
        ),
      ),
    );
  }

  Widget _Views1() {
    return Container(
      child: Form(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                CommonTextForm(
                  controllername: emailcontroler,
                  labelname: 'Email Id',
                ),
                const SizedBox(
                  height: 10,
                ),
                CommonTextForm(
                  controllername: passwordcontroller,
                  labelname: 'Password',
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF0A9494),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "LOGIN",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forget Password?",
                  style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ))
          ],
        ),
      ),
    );
  }
}
