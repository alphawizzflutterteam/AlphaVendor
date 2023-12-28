import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:flutter/material.dart';

class AddProdutScreen extends StatefulWidget {
  const AddProdutScreen({super.key});

  @override
  State<AddProdutScreen> createState() => _AddProdutScreenState();
}

class _AddProdutScreenState extends State<AddProdutScreen> {
  int selectedCat = 0;
  //jdkjdksjd
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommanAppbar(appbarTitle: "Add Product"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    selectedCat = 0;
                  }),
                  child: Container(
                    width: width * .43,
                    height: 50,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: selectedCat == 0
                            ? Color(0xFFCEEAEA)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "Add Product",
                      style: TextStyle(
                          color: selectedCat == 0
                              ? colors.buttonColor
                              : colors.greyText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                VerticalDivider(color: Colors.transparent),
                GestureDetector(
                  onTap: () => setState(() {
                    selectedCat = 1;
                  }),
                  child: Container(
                    width: width * .43,
                    height: 50,
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: selectedCat == 1
                          ? Color(0xFFCEEAEA)
                          : Colors.transparent,
                    ),
                    child: Text(
                      "Request Category",
                      style: TextStyle(
                          color: selectedCat == 1
                              ? colors.buttonColor
                              : colors.greyText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
