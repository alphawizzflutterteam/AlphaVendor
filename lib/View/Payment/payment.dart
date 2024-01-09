import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Utils/images.dart';
import 'package:alpha_work/ViewModel/walletViewModel.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:alpha_work/Widget/appLoader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late WalletViewMaodel walletPro;
  @override
  void initState() {
    walletPro = Provider.of<WalletViewMaodel>(context, listen: false);
    walletPro.orderTransactionList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    walletPro = Provider.of<WalletViewMaodel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommanAppbar(appbarTitle: "Payment"),
      body: walletPro.isLoading
          ? appLoader()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height * .13,
                  padding: const EdgeInsets.all(16),
                  color: colors.buttonColor.withOpacity(0.2),
                  child: Row(
                    children: [
                      Image.asset(
                        Images.paymentWallet,
                        height: height * .1,
                      ),
                      const VerticalDivider(
                          width: 8, color: Colors.transparent),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total Payment",
                            style: TextStyle(
                              fontSize: 14,
                              color: colors.greyText,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            "\$5000",
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.topRight,
                        child: PopupMenuButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          itemBuilder: (context) {
                            return {
                              'Cash',
                              'Online',
                              'Card Payment',
                              'Wallet Payment'
                            }.map((String choice) {
                              return PopupMenuItem<String>(
                                value: choice,
                                child: Text(choice),
                              );
                            }).toList();
                          },
                          iconColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Payments History",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Divider(color: Colors.transparent),
                      Container(
                        height: height * .65,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: walletPro.orderTransactions.length,
                          itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: colors.lightGrey,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      walletPro.orderTransactions[index].amount
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: colors.buttonColor,
                                        fontFamily: 'Montreal',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "ID- ${walletPro.orderTransactions[index].orderId.toString()}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: colors.greyText,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      walletPro
                                          .orderTransactions[index].createdAt
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: colors.greyText,
                                      ),
                                    ),
                                    Divider(
                                        color: Colors.transparent, height: 3),
                                    Text(
                                      walletPro.orderTransactions[index]
                                          .paymentMethod
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
