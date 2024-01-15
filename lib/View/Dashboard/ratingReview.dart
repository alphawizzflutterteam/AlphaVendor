import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Utils/images.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';

class RatingAndRewiewScreen extends StatefulWidget {
  const RatingAndRewiewScreen({super.key});

  @override
  State<RatingAndRewiewScreen> createState() => _RatingAndRewiewScreenState();
}

class _RatingAndRewiewScreenState extends State<RatingAndRewiewScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommanAppbar(appbarTitle: "Rating & Review"),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox.square(
                        dimension: (height / width) * 35,
                        child: Image.asset(Images.driver_profile),
                      ),
                      VerticalDivider(),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jane Cooper",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              "14,575 Global Rating",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: colors.greyText,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      RatingBar.readOnly(
                        size: 25,
                        halfFilledIcon: Icons.star_half,
                        isHalfAllowed: true,
                        filledIcon: Icons.star,
                        emptyIcon: Icons.star_border,
                        initialRating: 4.5,
                        maxRating: 5,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "4.7 out of 5",
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(color: colors.lightGrey),
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: ListView.builder(
                itemCount: 12,
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colors.lightGrey,
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Image.asset(
                          Images.powder,
                          height: 60,
                          width: 60,
                        ),
                      ),
                      VerticalDivider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Acer Monitor",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          RatingBar.readOnly(
                            size: 20,
                            halfFilledIcon: Icons.star_half,
                            isHalfAllowed: true,
                            filledIcon: Icons.star,
                            emptyIcon: Icons.star_border,
                            initialRating: 4.5,
                            maxRating: 5,
                          ),
                          Text(
                            "3.1 Rating",
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: colors.greyText,
                                    ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "\$120.0",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
