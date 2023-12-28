import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/comman_header.dart';
import 'package:flutter/material.dart';

class CommanAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String appbarTitle;

  const CommanAppbar({super.key, required this.appbarTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.transparent
            : colors.buttonColor,
        child: Stack(
          children: [
            ProfileHeader(),
            InternalDetailPageHeader(
              text: appbarTitle,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
