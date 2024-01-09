import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Utils/images.dart';
import 'package:alpha_work/View/Customer/customerDetail.dart';
import 'package:alpha_work/ViewModel/customerViewModel.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:alpha_work/Widget/appLoader.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  late CustomerViewModel provider;
  @override
  void initState() {
    provider = Provider.of<CustomerViewModel>(context, listen: false);
    provider.getCustomerList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    provider = Provider.of<CustomerViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommanAppbar(appbarTitle: "Customers"),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: provider.isLoading
            ? appLoader()
            : Column(
                children: [
                  SizedBox(
                    height: 45,
                    child: TextFormField(
                      // controller: searchcontroller,
                      onChanged: (String? value) {},
                      decoration: InputDecoration(
                        filled: true,
                        // fillColor: const Color.fromARGB(255, 233, 233, 253),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(width: 0, color: Colors.grey)),
                        hintText: "Search ",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.normal, color: Colors.grey),
                        prefixIcon: const Icon(Icons.search),
                        prefixIconColor: Colors.grey,
                      ),
                      style: const TextStyle(),
                    ),
                  ),
                  const Divider(color: Colors.transparent),
                  Expanded(
                    child: SizedBox(
                      child: ListView.builder(
                        itemCount: provider.customers.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              PageTransition(
                                  child: CustomerDetailScreen(
                                      data: provider.customers[index]),
                                  type: PageTransitionType.rightToLeft)),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                                color: colors.lightGrey,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: height * .06,
                                      width: height * .06,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Image.asset(
                                        Images.profile,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    VerticalDivider(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          provider.customers[index].fName
                                              .toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          provider.customers[index].phone
                                              .toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: colors.greyText,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Divider(height: 5, color: Colors.transparent),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Email",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: colors.greyText,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    Text(
                                      provider.customers[index].email
                                          .toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Address",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: colors.greyText,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    Text(
                                      "${provider.customers[index].streetAddress.toString()} ${provider.customers[index].city.toString()} ${provider.customers[index].state.toString()} ${provider.customers[index].country.toString()}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
