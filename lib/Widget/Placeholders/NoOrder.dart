import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Utils/images.dart';
import 'package:flutter/material.dart';

class NoOrderFound extends StatelessWidget {
  const NoOrderFound({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(Images.noOrder, fit: BoxFit.fitWidth),
        ),
        Text(
          "No Order Data Found",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: colors.buttonColor,
          ),
        )
      ],
    );
  }
}
