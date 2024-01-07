import 'package:alpha_work/ViewModel/profileViewModel.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

class TermsAndConditionScreen extends StatefulWidget {
  const TermsAndConditionScreen({super.key});

  @override
  State<TermsAndConditionScreen> createState() =>
      _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {
  late ProfileViewModel provider;
  @override
  void initState() {
    provider = Provider.of<ProfileViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommanAppbar(appbarTitle: "Terms and Condition"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Html(
                data: provider.staticPageData.termsNConditions!.content,
              ),
              Text(
                "Refund Policy",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Html(
                data: provider.staticPageData.refundPolicy!.content,
              ),
              Text(
                "Cancellation Policy",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Html(
                data: provider.staticPageData.cancellationPolicy!.content,
              ),
              Text(
                "Shipping Policy",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Html(
                data: provider.staticPageData.shippingDeliveryPolicy!.content,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
