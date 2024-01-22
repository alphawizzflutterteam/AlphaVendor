import 'dart:convert';

import 'package:alpha_work/Model/profileModel.dart';
import 'package:alpha_work/Model/vendorProfileModel.dart';
import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Utils/images.dart';
import 'package:alpha_work/Utils/shared_pref..dart';
import 'package:alpha_work/View/Profile/Chat/chat.dart';
import 'package:alpha_work/View/Profile/profile/Profile.dart';
import 'package:alpha_work/View/Profile/widgets/currencySheet.dart';
import 'package:alpha_work/View/Profile/widgets/logoutSheet.dart';
import 'package:alpha_work/ViewModel/profileViewModel.dart';
import 'package:alpha_work/Widget/appLoader.dart';
import 'package:alpha_work/Widget/errorImage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({super.key});

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  late ProfileViewModel profilePro;

  @override
  void initState() {
    profilePro = Provider.of<ProfileViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    profilePro = Provider.of<ProfileViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: profilePro.isLoading
          ? appLoader()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: height * .3,
                  decoration: BoxDecoration(
                      color: colors.buttonColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: AppBar(
                          backgroundColor: Colors.transparent,
                          forceMaterialTransparency: true,
                          automaticallyImplyLeading: false,
                          leading: InkWell(
                            onTap: () {
                              // Routes.navigateToPreviousScreen(context);
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                          centerTitle: true,
                          title: Text(
                            "Setting",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: height * .22,
                          ),
                          child: Image.asset(Images.profile_bg_circle),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        right: 16,
                        bottom: 16,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: (height / width) * 20,
                                backgroundImage: NetworkImage(
                                  profilePro.vendorData.image.toString(),
                                ),
                                onBackgroundImageError:
                                    (exception, stackTrace) =>
                                        ErrorImageWidget(height: 50),
                              ),
                              VerticalDivider(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: width * .55,
                                    child: Text(
                                      "${profilePro.vendorData.fName.toString().toUpperCase()} ${profilePro.vendorData.lName.toString().toUpperCase()}",
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.mail_outline_rounded,
                                          size: 14, color: colors.lightGrey),
                                      VerticalDivider(width: 5),
                                      Text(
                                        profilePro.vendorData.email.toString(),
                                        style: TextStyle(
                                          color: colors.lightGrey,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.phone,
                                        color: colors.lightGrey,
                                        size: 14,
                                      ),
                                      VerticalDivider(width: 5),
                                      Text(
                                        profilePro.vendorData.phone.toString(),
                                        style: TextStyle(
                                          color: colors.lightGrey,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          right: 30,
                          top: height * .12,
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                PageTransition(
                                    child: ProfileScreen(),
                                    type: PageTransitionType.rightToLeft)),
                            child: Image.asset(
                              Images.edit_button,
                              height: 20,
                            ),
                          ))
                    ],
                  ),
                ),
                Divider(
                  color: Colors.transparent,
                  height: 20,
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Color(0xFF4A5054)
                          : colors.lightGrey,
                      height: 1,
                    ),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: profileItem.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {
                          if (profileItem[i].profileText == "Currency") {
                            showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              builder: (context) => CurrencyBottomSheet(),
                            );
                          } else if (profileItem[i].profileText == "Logout") {
                            showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              builder: (context) => LogoutBottomSheet(),
                            );
                          } else if (profileItem[i].profileText ==
                              "Change Language") {
                            showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              builder: (context) => CurrencyBottomSheet(),
                            );
                          }
                          Navigator.push(
                            context,
                            PageTransition(
                                child: profileItem[i].navigationScreen,
                                type: PageTransitionType.rightToLeft),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: ListTile(
                            leading: Image.asset(
                              profileItem[i].profileIcon,
                              height: 30,
                              width: 30,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            title: Text(
                              profileItem[i].profileText,
                              style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 14),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            PageTransition(
                child: ChatScreen(), type: PageTransitionType.rightToLeft)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: ImageIcon(AssetImage(Images.chat), size: 30),
        backgroundColor: colors.buttonColor,
      ),
    );
  }
}
