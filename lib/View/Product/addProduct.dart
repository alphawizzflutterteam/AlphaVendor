import 'dart:io';
import 'dart:math';

import 'package:alpha_work/Model/productManagementModel.dart';
import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Utils/images.dart';
import 'package:alpha_work/View/Product/model/categoryModel.dart';
import 'package:alpha_work/ViewModel/productMgmtViewModel.dart';
import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProdutScreen extends StatefulWidget {
  const AddProdutScreen({super.key});

  @override
  State<AddProdutScreen> createState() => _AddProdutScreenState();
}

class _AddProdutScreenState extends State<AddProdutScreen> {
  int selectedCat = 0;
  late ProductManagementViewModel productProvider;
  var _formKey = GlobalKey<FormState>();
  final List<DropdownMenuItem> Taxitems = [
    DropdownMenuItem(
        child: Text(
          "Include",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        value: "include"),
    DropdownMenuItem(
        child: Text(
          "Exclude",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        value: "exclude"),
  ];
  final List<DropdownMenuItem> indicatoritems = [
    DropdownMenuItem(
        child: Text(
          "Veg",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        value: "Veg"),
    DropdownMenuItem(
        child: Text(
          "Non-veg",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        value: "Non-veg"),
  ];
  final List<DropdownMenuItem> discountItems = [
    DropdownMenuItem(
        child: Text(
          "Flat",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        value: "flat"),
    DropdownMenuItem(
        child: Text(
          "Percent",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        value: "percent"),
  ];
  final List<DropdownMenuItem> productType = [
    DropdownMenuItem(
        child: Text(
          "Physical",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        value: "physical"),
    DropdownMenuItem(
        child: Text(
          "Digital",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        value: "Digital"),
  ];
  final List<DropdownMenuItem> unitType = [
    DropdownMenuItem(
        child: Text(
          "KG",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        value: "kg"),
    DropdownMenuItem(
        child: Text(
          "PC",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        value: "pc"),
    DropdownMenuItem(
        child: Text(
          "GMS",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        value: "gms"),
  ];

  final nameCtrl = TextEditingController();
  final qtyInStockCtrl = TextEditingController();
  final skuIdCtrl = TextEditingController();
  final TagsCtrl = TextEditingController();
  final TaxCtrl = TextEditingController();
  final shippingCtrl = TextEditingController();
  final descCtrl = TextEditingController();
  final PurchaceCtrl = TextEditingController();
  final minQtyCtrl = TextEditingController();
  final warrantyCtrl = TextEditingController();
  final guaranteeCtrl = TextEditingController();
  final brandNameCtrl = TextEditingController();
  // final deliverableCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final discountPriceCtrl = TextEditingController();
  //function to genrate random Sku id
  String generateSku() {
    Random random = new Random();
    int skuId = random.nextInt(10000) + 999999;
    return skuId.toString();
  }

  void disposeMethod() {
    productProvider.setBrand(null);
    productProvider.setCategory(null);
    productProvider.setSubCategory(null);
    nameCtrl.clear;
    qtyInStockCtrl.clear;
    skuIdCtrl.clear;
    TagsCtrl.clear;
    TaxCtrl.clear;
    shippingCtrl.clear;
    descCtrl.clear;
    PurchaceCtrl.clear;
    minQtyCtrl.clear;
    warrantyCtrl.clear;
    guaranteeCtrl.clear;
    brandNameCtrl.clear;
    priceCtrl.clear;
    discountPriceCtrl.clear;
  }

  @override
  void dispose() {
    productProvider.setBrand(null);
    productProvider.setCategory(null);
    productProvider.setSubCategory(null);
    nameCtrl.dispose();
    qtyInStockCtrl.dispose();
    skuIdCtrl.dispose();
    TagsCtrl.dispose();
    TaxCtrl.dispose();
    shippingCtrl.dispose();
    descCtrl.dispose();
    PurchaceCtrl.dispose();
    minQtyCtrl.dispose();
    warrantyCtrl.dispose();
    guaranteeCtrl.dispose();
    brandNameCtrl.dispose();
    priceCtrl.dispose();
    discountPriceCtrl.dispose();
    super.dispose();
  }

  @override
  void initState() {
    skuIdCtrl.text = generateSku();
    productProvider =
        Provider.of<ProductManagementViewModel>(context, listen: false);
    productProvider.getCategory(id: '0');
    productProvider.getBrandList();
    super.initState();
  }

  String path = '';
  File? _image;
  final picker = ImagePicker();
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    print(pickedFile!.path.toString());
    path = pickedFile.path.toString();
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        productProvider.getImageUrl(path: path);
      }
    });
  }

  String? selectedPtype;
  String? selectedTax;
  String? selectedIndicator;
  String? selectedDiscount;
  String? selectedUnit;
  String? selectedValue;
  // bool switchVal = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommanAppbar(appbarTitle: "Add Product"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
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
              Divider(color: Colors.transparent),
              Form(
                key: _formKey,
                child: selectedCat == 0
                    ? Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: (const InputDecoration())
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(labelText: "Product Name"),
                              controller: nameCtrl,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter product name";
                                }
                                return null;
                              },
                            ),
                            const Divider(color: Colors.transparent),
                            Consumer<ProductManagementViewModel>(
                              builder: (context, val, child) {
                                return DropdownButtonFormField2<CategoryData>(
                                  decoration: const InputDecoration()
                                      .applyDefaults(Theme.of(context)
                                          .inputDecorationTheme)
                                      .copyWith(
                                          contentPadding:
                                              EdgeInsets.only(right: 10)),
                                  hint: Text("Select Category",
                                      style: TextStyle(
                                          color: colors.greyText,
                                          fontWeight: FontWeight.normal)),
                                  value: productProvider.selectedCat,
                                  onChanged: (CategoryData? value) =>
                                      setState(() {
                                    print(value?.id);
                                    productProvider.setCategory(value);

                                    // selectedValue = value;
                                    // print(selectedValue);
                                    productProvider.subCategoryclear();
                                    productProvider.getsubCategory(
                                        id: (value?.id.toString()).toString());
                                  }),
                                  items: productProvider.categories
                                      .map((e) => DropdownMenuItem(
                                            child: Text(
                                              e.name.toString(),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            value: e,
                                          ))
                                      .toList(),
                                );
                              },
                            ),
                            const Divider(color: Colors.transparent),
                            Consumer<ProductManagementViewModel>(
                                builder: (context, catvalue, child) {
                              return DropdownButtonFormField2<CategoryData>(
                                decoration: const InputDecoration()
                                    .applyDefaults(
                                        Theme.of(context).inputDecorationTheme)
                                    .copyWith(
                                        contentPadding:
                                            EdgeInsets.only(right: 10)),
                                hint: Text("Select Sub Category",
                                    style: TextStyle(
                                        color: colors.greyText,
                                        fontWeight: FontWeight.normal)),
                                value: catvalue.selectedSubCat,
                                onChanged: (CategoryData? value) =>
                                    setState(() {
                                  print(value?.id);
                                  catvalue.setSubCategory(value);
                                  // productProvider.getCategory(
                                  //     id: (value?.id.toString()).toString());
                                }),
                                items: productProvider.subcategories
                                    .map((e) => DropdownMenuItem(
                                          child: Text(
                                            e.name.toString(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          value: e,
                                        ))
                                    .toList(),
                              );
                            }),
                            const Divider(color: Colors.transparent),
                            DropdownButtonFormField2(
                              decoration: const InputDecoration()
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(
                                      contentPadding:
                                          EdgeInsets.only(right: 10)),
                              hint: Text("Select Product Type",
                                  style: TextStyle(
                                      color: colors.greyText,
                                      fontWeight: FontWeight.normal)),
                              value: selectedPtype,
                              onChanged: (value) => setState(() {
                                selectedPtype = value ?? "";
                              }),
                              items: productType,
                            ),
                            const Divider(color: Colors.transparent),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: (const InputDecoration())
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(
                                    labelText: "Quantity in Stock",
                                  ),
                              controller: qtyInStockCtrl,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter quantity in stock";
                                }
                                return null;
                              },
                            ),
                            const Divider(color: Colors.transparent),
                            TextFormField(
                              enabled: false,
                              decoration: (const InputDecoration())
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(
                                    labelText: "SKU ID",
                                  ),
                              controller: skuIdCtrl,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter SKU Id";
                                }
                                return null;
                              },
                            ),
                            // const Divider(color: Colors.transparent),
                            // TextFormField(
                            //   decoration: (const InputDecoration())
                            //       .applyDefaults(
                            //           Theme.of(context).inputDecorationTheme)
                            //       .copyWith(labelText: "Add Tags"),
                            //   controller: TagsCtrl,
                            //   validator: (value) {
                            //     if (value == null || value.isEmpty) {
                            //       return "Enter tags";
                            //     }
                            //     return null;
                            //   },
                            // ),
                            const Divider(color: Colors.transparent),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: (const InputDecoration())
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(labelText: "Shipping Cost"),
                              controller: shippingCtrl,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter shipping cost";
                                }
                                return null;
                              },
                            ),
                            const Divider(color: Colors.transparent),
                            SizedBox(
                              height: height * .15,
                              child: TextFormField(
                                maxLines: 5,
                                decoration: (const InputDecoration())
                                    .applyDefaults(
                                        Theme.of(context).inputDecorationTheme)
                                    .copyWith(
                                        labelText: "Short Description",
                                        contentPadding:
                                            const EdgeInsets.all(8)),
                                controller: descCtrl,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter description";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const Divider(color: Colors.transparent),
                            DropdownButtonFormField2(
                              decoration: const InputDecoration()
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(
                                      contentPadding:
                                          EdgeInsets.only(right: 10)),
                              hint: Text("Select Tax",
                                  style: TextStyle(
                                      color: colors.greyText,
                                      fontWeight: FontWeight.normal)),
                              value: selectedTax,
                              onChanged: (value) => setState(() {
                                selectedTax = value ?? "";
                              }),
                              items: Taxitems,
                            ),

                            const Divider(color: Colors.transparent),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: (const InputDecoration())
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(labelText: "Add Tax in %"),
                              controller: TaxCtrl,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter Tax";
                                }
                                return null;
                              },
                            ),
                            const Divider(color: Colors.transparent),
                            DropdownButtonFormField2(
                              decoration: const InputDecoration()
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(
                                      contentPadding:
                                          EdgeInsets.only(right: 10)),
                              hint: Text("Select Unit",
                                  style: TextStyle(
                                      color: colors.greyText,
                                      fontWeight: FontWeight.normal)),
                              value: selectedUnit,
                              onChanged: (value) => setState(() {
                                selectedUnit = value;
                              }),
                              items: unitType,
                            ),
                            const Divider(color: Colors.transparent),
                            // DropdownButtonFormField2(
                            //   decoration: const InputDecoration()
                            //       .applyDefaults(
                            //           Theme.of(context).inputDecorationTheme)
                            //       .copyWith(
                            //           contentPadding:
                            //               EdgeInsets.only(right: 10)),
                            //   hint: Text("Select Indicator",
                            //       style: TextStyle(
                            //           color: colors.greyText,
                            //           fontWeight: FontWeight.normal)),
                            //   value: selectedIndicator,
                            //   onChanged: (value) => setState(() {
                            //     selectedIndicator = value ?? "";
                            //   }),
                            //   items: indicatoritems,
                            // ),
                            // const Divider(color: Colors.transparent),

                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: (const InputDecoration())
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(
                                      labelText: "Minimum Order Quantity"),
                              controller: minQtyCtrl,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter minimum order quantity";
                                }
                                return null;
                              },
                            ),
                            // const Divider(color: Colors.transparent),
                            // TextFormField(
                            //   decoration: (const InputDecoration())
                            //       .applyDefaults(
                            //           Theme.of(context).inputDecorationTheme)
                            //       .copyWith(labelText: "Warranty Period"),
                            //   controller: warrantyCtrl,
                            //   validator: (value) {
                            //     if (value == null || value.isEmpty) {
                            //       return "Enter warranty period";
                            //     }
                            //     return null;
                            //   },
                            // ),
                            // const Divider(color: Colors.transparent),
                            // TextFormField(
                            //   decoration: (const InputDecoration())
                            //       .applyDefaults(
                            //           Theme.of(context).inputDecorationTheme)
                            //       .copyWith(labelText: "Guarantee Period"),
                            //   controller: guaranteeCtrl,
                            //   validator: (value) {
                            //     if (value == null || value.isEmpty) {
                            //       return "Enter guarantee period";
                            //     }
                            //     return null;
                            //   },
                            // ),
                            const Divider(color: Colors.transparent),
                            Consumer<ProductManagementViewModel>(
                                builder: (context, brandVal, _) {
                              return DropdownButtonFormField2(
                                decoration: const InputDecoration()
                                    .applyDefaults(
                                        Theme.of(context).inputDecorationTheme)
                                    .copyWith(
                                        contentPadding:
                                            EdgeInsets.only(right: 10)),
                                hint: Text("Brand",
                                    style: TextStyle(
                                        color: colors.greyText,
                                        fontWeight: FontWeight.normal)),
                                value: brandVal.selectedBrand,
                                onChanged: (value) => setState(() {
                                  brandVal.setBrand(value);
                                }),
                                items: brandVal.brandList
                                    .map((e) => DropdownMenuItem(
                                          child: Text(
                                            e.name.toString(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          value: e,
                                        ))
                                    .toList(),
                              );
                            }),
                            const Divider(color: Colors.transparent),
                            // TextFormField(
                            //   decoration: (const InputDecoration())
                            //       .applyDefaults(
                            //           Theme.of(context).inputDecorationTheme)
                            //       .copyWith(labelText: "Deliverable Type"),
                            // ),
                            // const Divider(color: Colors.transparent),
                            // DropdownButtonFormField2(
                            // decoration: const InputDecoration()
                            // .applyDefaults(
                            // Theme.of(context).inputDecorationTheme)
                            // .copyWith(
                            // contentPadding:
                            // EdgeInsets.only(right: 10)),
                            // hint: Text("Select Color",
                            // style: TextStyle(
                            // color: colors.greyText,
                            // fontWeight: FontWeight.normal)),
                            // value: selectedValue,
                            // onChanged: (value) => setState(() {
                            // selectedValue = value ?? "";
                            // }),
                            // items: Taxitems,
                            // ),
                            // const Divider(color: Colors.transparent),
                            Row(
                              children: [
                                DottedBorder(
                                  color: colors.buttonColor,
                                  strokeWidth: 1,
                                  child: GestureDetector(
                                    onTap: () => getImageFromGallery(),
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD5F6F6),
                                      ),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            Images.selectImage,
                                            height: 30,
                                            width: 30,
                                            fit: BoxFit.fitHeight,
                                          ),
                                          Text(
                                            "Main Image",
                                            style: TextStyle(
                                              color: colors.buttonColor,
                                              fontSize: 12,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                VerticalDivider(color: Colors.transparent),
                                Container(
                                  height: height * .1,
                                  width: width * .25,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: colors.lightGrey,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: path.isEmpty
                                      ? Text(
                                          "Image\nContainer",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                        )
                                      : Image.file(
                                          _image!,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ],
                            ),
                            const Divider(color: Colors.transparent),
                            // Row(
                            //   children: [
                            //     DottedBorder(
                            //       color: colors.buttonColor,
                            //       strokeWidth: 1,
                            //       child: ClipRRect(
                            //         borderRadius: BorderRadius.circular(10),
                            //         child: Container(
                            //           padding: const EdgeInsets.all(15),
                            //           decoration: BoxDecoration(
                            //               color: Color(0xFFD5F6F6),
                            //               borderRadius:
                            //                   BorderRadius.circular(10)),
                            //           child: Column(
                            //             children: [
                            //               Image.asset(
                            //                 Images.selectImage,
                            //                 height: 30,
                            //                 width: 30,
                            //                 fit: BoxFit.fitHeight,
                            //               ),
                            //               Text(
                            //                 "Other Image",
                            //                 style: TextStyle(
                            //                   color: colors.buttonColor,
                            //                   fontSize: 12,
                            //                 ),
                            //               )
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //     VerticalDivider(color: Colors.transparent),
                            //     Container(
                            //       height: height * .1,
                            //       width: width * .25,
                            //       alignment: Alignment.center,
                            //       decoration: BoxDecoration(
                            //           color: colors.lightGrey,
                            //           borderRadius: BorderRadius.circular(10)),
                            //       child: Text(
                            //         "Image\nContainer",
                            //         textAlign: TextAlign.center,
                            //         style: TextStyle(
                            //           color: Colors.black,
                            //           fontSize: 12,
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // const Divider(color: Colors.transparent),
                            // Row(
                            //   children: [
                            //     DottedBorder(
                            //       color: colors.buttonColor,
                            //       strokeWidth: 1,
                            //       child: ClipRRect(
                            //         borderRadius: BorderRadius.circular(10),
                            //         child: Container(
                            //           width: width * .24,
                            //           padding: const EdgeInsets.all(15),
                            //           decoration: BoxDecoration(
                            //               color: Color(0xFFD5F6F6),
                            //               borderRadius:
                            //                   BorderRadius.circular(10)),
                            //           child: Column(
                            //             children: [
                            //               Icon(
                            //                   Icons.play_circle_outline_rounded,
                            //                   color: colors.buttonColor,
                            //                   size: 25),
                            //               Text(
                            //                 "Video",
                            //                 style: TextStyle(
                            //                   color: colors.buttonColor,
                            //                   fontSize: 12,
                            //                 ),
                            //               )
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //     VerticalDivider(color: Colors.transparent),
                            //     Container(
                            //       height: height * .1,
                            //       width: width * .25,
                            //       alignment: Alignment.center,
                            //       decoration: BoxDecoration(
                            //           color: colors.lightGrey,
                            //           borderRadius: BorderRadius.circular(10)),
                            //       child: Text(
                            //         "Video\nContainer",
                            //         textAlign: TextAlign.center,
                            //         style: TextStyle(
                            //           color: Colors.black,
                            //           fontSize: 12,
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // const Divider(color: Colors.transparent),
                            // Row(
                            //   children: [
                            //     SizedBox(
                            //       width: width * .78,
                            //       child: TextFormField(
                            //         decoration: (const InputDecoration())
                            //             .applyDefaults(Theme.of(context)
                            //                 .inputDecorationTheme)
                            //             .copyWith(labelText: "Coupon"),
                            //       ),
                            //     ),
                            //     Switch(
                            //       value: switchVal,
                            //       activeColor: colors.buttonColor,
                            //       inactiveThumbColor: colors.greyText,
                            //       inactiveTrackColor: colors.lightGrey,
                            //       onChanged: (value) => setState(() {
                            //         switchVal = value;
                            //       }),
                            //     )
                            //   ],
                            // ),
                            DropdownButtonFormField2(
                              decoration: const InputDecoration()
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(
                                      contentPadding:
                                          EdgeInsets.only(right: 10)),
                              hint: Text("Type of product & Price",
                                  style: TextStyle(
                                      color: colors.greyText,
                                      fontWeight: FontWeight.normal)),
                              value: selectedValue,
                              items: Taxitems,
                            ),
                            const Divider(color: Colors.transparent),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: priceCtrl,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter price";
                                }
                                return null;
                              },
                              decoration: (const InputDecoration())
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(labelText: "Price"),
                            ),
                            const Divider(color: Colors.transparent),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: (const InputDecoration())
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(labelText: "Purchase Price"),
                              controller: PurchaceCtrl,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter total allowed quantity";
                                }
                                return null;
                              },
                            ),
                            const Divider(color: Colors.transparent),
                            DropdownButtonFormField2(
                              decoration: const InputDecoration()
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(
                                      contentPadding:
                                          EdgeInsets.only(right: 10)),
                              hint: Text("Discount",
                                  style: TextStyle(
                                      color: colors.greyText,
                                      fontWeight: FontWeight.normal)),
                              value: selectedDiscount,
                              onChanged: (value) => setState(() {
                                selectedDiscount = value ?? "";
                              }),
                              items: discountItems,
                            ),
                            const Divider(color: Colors.transparent),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: discountPriceCtrl,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter discount price";
                                }
                                return null;
                              },
                              decoration: (const InputDecoration())
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(
                                      labelText: selectedDiscount == "Flat"
                                          ? "Discount Price "
                                          : "Discount in %"),
                            ),
                            const Divider(color: Colors.transparent),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              decoration: (const InputDecoration())
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(labelText: "Brand Name"),
                            ),
                            const Divider(color: Colors.transparent),
                            TextFormField(
                              decoration: (const InputDecoration())
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(labelText: "Category Name"),
                            ),
                            const Divider(color: Colors.transparent),
                            TextFormField(
                              decoration: (const InputDecoration())
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(labelText: "Sub Category Name"),
                            ),
                            const Divider(color: Colors.transparent),
                            SizedBox(
                              height: height * .15,
                              child: TextFormField(
                                maxLines: 5,
                                decoration: (const InputDecoration())
                                    .applyDefaults(
                                        Theme.of(context).inputDecorationTheme)
                                    .copyWith(
                                      labelText: "Short Description",
                                    ),
                              ),
                            ),
                            const Divider(color: Colors.transparent),
                            TextFormField(
                              decoration: (const InputDecoration())
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(labelText: "Meta Tag"),
                            ),
                            const Divider(color: Colors.transparent),
                            Row(
                              children: [
                                DottedBorder(
                                  color: colors.buttonColor,
                                  strokeWidth: 1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 15),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFD5F6F6),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            Images.selectImage,
                                            height: 30,
                                            width: 30,
                                            fit: BoxFit.fitHeight,
                                          ),
                                          Text(
                                            "Thumbnail\nImage",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: colors.buttonColor,
                                              fontSize: 12,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                VerticalDivider(color: Colors.transparent),
                                Container(
                                  height: height * .1,
                                  width: width * .25,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: colors.lightGrey,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    "Image\nContainer",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(color: Colors.transparent),
                            Text(
                              "Attributes and Filters",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const Divider(color: Colors.transparent),
                            DropdownButtonFormField2(
                              decoration: const InputDecoration()
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(
                                      contentPadding:
                                          EdgeInsets.only(right: 10)),
                              hint: Text("Size",
                                  style: TextStyle(color: colors.greyText)),
                              value: selectedValue,
                              onChanged: (value) => setState(() {
                                selectedValue = value ?? "";
                              }),
                              items: Taxitems,
                            ),
                            const Divider(color: Colors.transparent),
                            DropdownButtonFormField2(
                              decoration: const InputDecoration()
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(
                                      contentPadding:
                                          EdgeInsets.only(right: 10)),
                              hint: Text("Color",
                                  style: TextStyle(color: colors.greyText)),
                              value: selectedValue,
                              onChanged: (value) => setState(() {
                                selectedValue = value ?? "";
                              }),
                              items: Taxitems,
                            ),
                            const Divider(color: Colors.transparent),
                          ],
                        ),
                      ),
              ),
              selectedCat == 0
                  ? ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print(nameCtrl.text);
                          print(productProvider.selectedCat?.id);
                          print(productProvider.selectedSubCat?.id);
                          print(selectedPtype);
                          print(qtyInStockCtrl.text);
                          print(skuIdCtrl.text);
                          print(shippingCtrl.text);
                          print(selectedTax);
                          print(TaxCtrl.text);
                          print(PurchaceCtrl.text);
                          print(minQtyCtrl.text);
                          print(productProvider.thumbnail);
                          print(productProvider.selectedBrand?.id);
                          print(priceCtrl.text);
                          print(selectedDiscount);
                          print(discountPriceCtrl.text);
                          productProvider
                              .appProduct(
                            name: nameCtrl.text.toString(),
                            category_id:
                                productProvider.selectedCat!.id.toString(),
                            sub_category_id:
                                productProvider.selectedSubCat!.id.toString(),
                            product_type: selectedPtype.toString(),
                            unit: selectedUnit.toString(),
                            thumbnail: productProvider.thumbnail,
                            discount_type: selectedDiscount.toString(),
                            discount: discountPriceCtrl.text.toString(),
                            tax: TaxCtrl.text.toString(),
                            tax_type: selectedTax.toString(),
                            unit_price: priceCtrl.text.toString(),
                            shipping_cost: shippingCtrl.text.toString(),
                            skuId: skuIdCtrl.text.toString(),
                            minimum_order_qty: minQtyCtrl.text.toString(),
                            brand_id:
                                productProvider.selectedBrand!.id.toString(),
                            quantity: qtyInStockCtrl.text.toString(),
                            description: descCtrl.text.toString(),
                            purchase_price: PurchaceCtrl.text.toString(),
                          )
                              .then((value) {
                            if (value) {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.success,
                                animType: AnimType.scale,
                                autoDismiss: false,
                                onDismissCallback: (type) {},
                                title: "Product Added Successfully",
                                btnOkOnPress: () {
                                  Navigator.pop(context);
                                },
                              )..show();
                            } else {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.scale,
                                autoDismiss: false,
                                onDismissCallback: (type) {},
                                title: "Something went wrong!",
                                btnOkColor: Colors.red,
                                btnOkOnPress: () => Navigator.pop(context),
                              )..show();
                            }
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(width, 50),
                          backgroundColor: colors.buttonColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text(
                        selectedCat == 0 ? "ADD PRODUCT" : "REQUEST CATEGORY",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                  : ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(width, 50),
                          backgroundColor: colors.buttonColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text(
                        "REQUEST CATEGORY",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
              Divider(color: Colors.transparent),
            ],
          ),
        ),
      ),
    );
  }
}
