import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';

class PriceSection extends StatefulWidget {
  const PriceSection({Key key}) : super(key: key);

  @override
  _PriceSectionState createState() => _PriceSectionState();
}

class _PriceSectionState extends State<PriceSection> {
  AddProductsController addProductsController =
      Get.put(AddProductsController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      physics: BouncingScrollPhysics(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          //margin: EdgeInsets.only(left: 5),
          padding: EdgeInsets.only(left: 5, bottom: 100),
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
                key: const ValueKey("ProductSize"),
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: "ProductSize",
                ),
                controller: addProductsController.productSize,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                key: const ValueKey("ProductAmount"),
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: "ProductAmount",
                ),
                controller: addProductsController.productAmount,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                key: const ValueKey("ProductPrice"),
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
                key: const ValueKey("ProductDescription"),
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: "ProductDescription",
                ),
                controller: addProductsController.otherProductDescription,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
