import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';

class PriceSection extends StatefulWidget {
  const PriceSection({Key key}) : super(key: key);

  @override
  _PriceSectionState createState() => _PriceSectionState();
}

class _PriceSectionState extends State<PriceSection> {
  final TextEditingController _productPrice = TextEditingController();
  final TextEditingController _productDescription = TextEditingController();

  AddProductsController addProductsController =
      Get.put(AddProductsController());

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        //margin: EdgeInsets.only(left: 5),
        padding: EdgeInsets.only(left: 5, bottom: 100),
        //height: Get.height * 0.07,
        width: Get.width * 0.4,
        child: Column(
          children: [
            TextFormField(
              key: const ValueKey("ProductPrice"),
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: "ProductPrice",
              ),
              controller: _productPrice,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              key: const ValueKey("ProductDescription"),
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: "ProductDescription",
              ),
              controller: _productDescription,
            ),
          ],
        ),
      )
    ]);
  }
}
