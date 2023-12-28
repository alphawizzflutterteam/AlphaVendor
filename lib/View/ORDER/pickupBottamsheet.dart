import 'package:alpha_work/Utils/color.dart';
import 'package:flutter/material.dart';

class PickupBottomSheet extends StatefulWidget {
  @override
  State<PickupBottomSheet> createState() => _PickupBottomSheetState();
}

class _PickupBottomSheetState extends State<PickupBottomSheet> {
  final List<DropdownMenuItem> items = [
    DropdownMenuItem(child: Text("Sunday"), value: "Sunday"),
    DropdownMenuItem(child: Text("Monday"), value: "Monday"),
    DropdownMenuItem(child: Text("Tuesday"), value: "Tuesday"),
    DropdownMenuItem(child: Text("Wednesday"), value: "Wednesday"),
    DropdownMenuItem(child: Text("Thursday"), value: "Thursday"),
    DropdownMenuItem(child: Text("Friday"), value: "Friday"),
    DropdownMenuItem(child: Text("Saturday"), value: "Saturday"),
  ];

  String selectedValue = "Sunday";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .3,
      width: double.maxFinite,
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
              "Pickup Slot",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Divider(color: Colors.transparent),
          DropdownButtonFormField(
            decoration: const InputDecoration()
                .applyDefaults(Theme.of(context).inputDecorationTheme),
            value: selectedValue,
            onChanged: (value) => setState(() {
              selectedValue = value;
            }),
            items: items,
          ),
          Divider(color: Colors.transparent),
          Container(
            height: MediaQuery.of(context).size.height * .053,
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: colors.boxBorder,
              ),
            ),
            child: Row(
              children: [
                Text("Pickup Date",
                    style: TextStyle(
                      fontSize: 16,
                      color: colors.greyText,
                      fontWeight: FontWeight.bold,
                    )),
                Spacer(),
                Icon(
                  Icons.schedule,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Divider(color: Colors.transparent),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: colors.buttonColor,
                  padding: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              child: Text(
                "SCHEDULE PICKUP",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
