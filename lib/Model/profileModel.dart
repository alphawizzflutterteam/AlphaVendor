import 'package:alpha_work/Utils/images.dart';
import 'package:alpha_work/View/Profile/Advertising/advertising.dart';
import 'package:alpha_work/View/Profile/Faq/faq.dart';
import 'package:alpha_work/View/Profile/referEarn/referEarn.dart';
import 'package:alpha_work/View/Profile/subscription/subscription.dart';
import 'package:alpha_work/View/Profile/support/support.dart';
import 'package:alpha_work/View/Profile/termsCondition/termsCondition.dart';
import 'package:alpha_work/View/changePassword/changePassword.dart';
import 'package:flutter/material.dart';

class ProfileList {
  String profileIcon;
  String profileText;
  dynamic navigationScreen;
  ProfileList(
      {required this.profileIcon,
      required this.profileText,
      required this.navigationScreen});
}

List<ProfileList> profileItem = [
  ProfileList(
      profileIcon: Images.referAndEarn,
      profileText: 'Refer and Earn',
      navigationScreen: const ReferAndEarnScreen()),
  ProfileList(
      profileIcon: Images.subscribe,
      profileText: 'Subscription',
      navigationScreen: const SubscriptionScreen()),
  ProfileList(
      profileIcon: Images.support,
      profileText: 'Customer Support',
      navigationScreen: const CustomerSupportScreen()),
  ProfileList(
      profileIcon: Images.terms,
      profileText: 'Terms and Conditions',
      navigationScreen: const TermsAndConditionScreen()),
  //  ProfileList(
  //     profileIcon: Images.changePassword,
  //     profileText: 'Privacy Policy',
  //     navigationScreen: ChangePasswordScreen()),
  ProfileList(
      profileIcon: Images.faq,
      profileText: 'FAQ',
      navigationScreen: const FaqScreen()),
  ProfileList(
      profileIcon: Images.speaker,
      profileText: 'Adverting',
      navigationScreen: const AdvertisingScreen()),
  ProfileList(
      profileIcon: Images.currency,
      profileText: 'Currency',
      navigationScreen: ""),
  ProfileList(
      profileIcon: Images.changePassword,
      profileText: 'Change Password',
      navigationScreen: ChangePasswordScreen()),
  ProfileList(
      profileIcon: Images.changeLanguage,
      profileText: 'Change Language',
      navigationScreen: ""),

  ProfileList(
      profileIcon: Images.logOut, profileText: 'Logout', navigationScreen: ""),
];
