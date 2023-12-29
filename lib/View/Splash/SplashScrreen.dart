import 'package:alpha_work/View/AUTH/LOGIN/loginpage.dart';
import 'package:flutter/material.dart';

import '../language/launguageSelection.dart';

class SpalashScreen extends StatefulWidget {
  const SpalashScreen({super.key});

  @override
  State<SpalashScreen> createState() => _SpalashScreenState();
}

class _SpalashScreenState extends State<SpalashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NavigatetonextScreen();
  }

  NavigatetonextScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: ((context) => const LoginPage())),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          "assets/images/splash.png",
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
