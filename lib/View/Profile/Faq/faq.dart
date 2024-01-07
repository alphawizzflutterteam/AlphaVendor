import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/ViewModel/profileViewModel.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
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
      appBar: CommanAppbar(appbarTitle: "FAQ"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          separatorBuilder: (context, index) =>
              Divider(color: Colors.transparent),
          itemCount: provider.staticPageData.faq.length,
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: colors.lightGrey,
                borderRadius: BorderRadius.circular(6)),
            child: ExpandablePanel(
              header: Text(
                provider.staticPageData.faq[index].question.toString(),
                style: TextStyle(fontSize: 20, fontFamily: 'Montreal'),
              ),
              collapsed: Text(
                provider.staticPageData.faq[index].answer.toString(),
                softWrap: true,
                maxLines: 1,
                style:
                    TextStyle(fontFamily: 'Montreal', color: colors.greyText),
                overflow: TextOverflow.ellipsis,
              ),
              expanded: Text(
                provider.staticPageData.faq[index].answer.toString(),
                style:
                    TextStyle(fontFamily: 'Montreal', color: colors.greyText),
                softWrap: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
