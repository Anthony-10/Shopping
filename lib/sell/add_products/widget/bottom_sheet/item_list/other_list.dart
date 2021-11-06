import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';

class OtherList extends StatefulWidget {
  const OtherList({Key key}) : super(key: key);

  @override
  _OtherListState createState() => _OtherListState();
}

class _OtherListState extends State<OtherList> {
  AddProductsController addProductsController =
      Get.put(AddProductsController());

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        //margin: EdgeInsets.only(left: 5),
        padding: EdgeInsets.only(left: 5, bottom: 150),
        //height: Get.height * 0.07,
        width: Get.width * 0.4,
        child: Column(
          children: [
            TextFormField(
              key: const ValueKey("ProductName"),
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: "ProductName",
              ),
              controller: addProductsController.productName,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              key: const ValueKey("OtherProductPrice"),
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: "ProductPrice",
              ),
              controller: addProductsController.otherProductPrice,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              key: const ValueKey("OtherProductDescription"),
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: "ProductDescription",
              ),
              controller: addProductsController.otherProductDescription,
            ),
          ],
        ),
      )
    ]);
  }
}
