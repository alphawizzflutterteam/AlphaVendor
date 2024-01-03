import 'package:alpha_work/Model/profileModel.dart';
import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Utils/images.dart';
import 'package:alpha_work/View/Profile/Chat/chat.dart';
import 'package:alpha_work/View/Profile/profile/Profile.dart';
import 'package:alpha_work/View/Profile/widgets/currencySheet.dart';
import 'package:alpha_work/View/Profile/widgets/logoutSheet.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ProfileSettingScreen extends StatelessWidget {
  const ProfileSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: height * .32,
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
                          child: Image.asset(Images.driver_profile),
                        ),
                        VerticalDivider(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jane Cooper",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.mail_outline_rounded,
                                    size: 14, color: colors.lightGrey),
                                VerticalDivider(width: 5),
                                Text(
                                  "Jane Cooper@example.com",
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
                                  "9685762333",
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
                    top: height * .15,
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
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                      title: Text(
                        profileItem[i].profileText,
                        style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                            fontSize: 14),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Theme.of(context).brightness == Brightness.dark
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
