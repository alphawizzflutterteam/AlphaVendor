import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Utils/images.dart';
import 'package:alpha_work/View/ORDER/pickupBottamsheet.dart';
import 'package:alpha_work/View/ORDER/pickupDetail.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commanBackground.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/comman_header.dart';
import 'package:flutter/material.dart';

class PickupSlotScreen extends StatefulWidget {
  const PickupSlotScreen({super.key});

  @override
  State<PickupSlotScreen> createState() => _PickupSlotScreenState();
}

class _PickupSlotScreenState extends State<PickupSlotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.transparent
                : colors.buttonColor,
            child: const Stack(
              children: [
                ProfileHeader(),
                InternalDetailPageHeader(
                  text: "Pickup Slot",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: SizedBox(
              height: 40,
              child: TextField(
                // controller: searchcontroller,
                onChanged: (String? value) {
                  setState(() {
                    // search = value.toString();
                  });
                },

                decoration: InputDecoration(
                  filled: true,
                  contentPadding: EdgeInsets.only(top: 8),
                  // fillColor: const Color.fromARGB(255, 233, 233, 253),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(width: 1, color: colors.boxBorder)),
                  hintText: "Search ",
                  hintStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.black,
                ),
                style: const TextStyle(),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PickupDetailScreen(),
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(
                            bottom: 10, left: 10, right: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFFE9E9E9)),
                        height: MediaQuery.of(context).size.height * .17,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Oats Fitness",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Id - OID52466246325",
                              style: TextStyle(
                                fontSize: 14,
                                color: colors.greyText,
                              ),
                            ),
                            Text(
                              "03-Feb-2023",
                              style: TextStyle(
                                fontSize: 14,
                                color: colors.greyText,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "\$ 120",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () => showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                    ),
                                    context: context,
                                    builder: (context) => PickupBottomSheet(),
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .3,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: colors.buttonColor,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      "SHIP NOW",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
