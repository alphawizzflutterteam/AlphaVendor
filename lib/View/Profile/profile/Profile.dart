import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommanAppbar(appbarTitle: "Profile"),
    );
  }
}
