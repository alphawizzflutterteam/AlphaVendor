import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Utils/images.dart';
import 'package:alpha_work/View/Product/activeProduct.dart';
import 'package:alpha_work/View/Product/addProduct.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ProductManagementScreen extends StatefulWidget {
  const ProductManagementScreen({super.key});

  @override
  State<ProductManagementScreen> createState() =>
      _ProductManagementScreenState();
}

class _ProductManagementScreenState extends State<ProductManagementScreen> {
  int slectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommanAppbar(appbarTitle: "Product Management"),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            color: colors.lightGrey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: height * .1,
                  width: width * .29,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Product",
                        style: TextStyle(
                          fontSize: 14,
                          color: colors.greyText,
                        ),
                      ),
                      Text(
                        "543",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    PageTransition(
                        child: ActiveProductScreen(),
                        type: PageTransitionType.rightToLeft),
                  ),
                  child: Container(
                    height: height * .1,
                    width: width * .29,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Active",
                          style: TextStyle(
                            fontSize: 14,
                            color: colors.greyText,
                          ),
                        ),
                        Text(
                          "500",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: height * .1,
                  width: width * .29,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Inactive",
                        style: TextStyle(
                          fontSize: 14,
                          color: colors.greyText,
                        ),
                      ),
                      Text(
                        "43",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: SizedBox(
              width: width,
              height: 30,
              child: ListView.builder(
                itemCount: 7,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => setState(() {
                    slectedIndex = index;
                  }),
                  child: Container(
                    height: 30,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: slectedIndex == index
                          ? Color(0xFFD5F6F6)
                          : Colors.transparent,
                    ),
                    child: Text(
                      "Category $index",
                      style: TextStyle(
                        fontSize: 12,
                        color: slectedIndex == index
                            ? colors.buttonColor
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: SizedBox(
              height: height * .66,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: 7,
                itemBuilder: (context, index) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      Images.powder,
                      height: height * .1,
                      fit: BoxFit.fitHeight,
                    ),
                    Text(
                      "Product Name $index",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            PageTransition(
                child: AddProdutScreen(),
                type: PageTransitionType.rightToLeft)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: colors.buttonColor,
        child: Icon(Icons.add),
      ),
    );
  }
}
