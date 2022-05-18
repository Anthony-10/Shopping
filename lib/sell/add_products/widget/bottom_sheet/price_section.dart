import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        //margin: EdgeInsets.only(left: 5),
        padding: EdgeInsets.only(left: 5, bottom: 100),
        //height: Get.height * 0.07,
        width: Get.width * 0.4,
        child: Form(
          key: addProductsController.formKey,
          child: Column(
            children: [
              TextFormField(
                key: const ValueKey("ProductName"),
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  labelText: 'ProductName',
                ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null ||
                      value
                          .isEmpty /*RegExp(r'^[a-z A-Z]+$').hasMatch(value)*/) {
                    return 'Enter correct ProductName';
                  } else {
                    return null;
                  }
                },
                controller: addProductsController.productName,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                key: const ValueKey("ProductSize"),
                textAlign: TextAlign.start,
                decoration: InputDecoration(labelText: "ProductSize"),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: (value) {
                  if (value == null ||
                      value
                          .isEmpty /*RegExp(r'^[a-z A-Z]+$').hasMatch(value)*/) {
                    return 'Enter correct ProductSize';
                  } else {
                    return null;
                  }
                },
                controller: addProductsController.productSize,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                key: const ValueKey("ProductAmount"),
                textAlign: TextAlign.start,
                decoration: InputDecoration(labelText: "ProductAmount"),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: (value) {
                  if (value == null ||
                      value.isEmpty /*RegExp(r'^[0-9]+$').hasMatch(value)*/) {
                    return 'Enter correct ProductSize';
                  } else {
                    return null;
                  }
                },
                controller: addProductsController.productAmount,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                key: const ValueKey("ProductPrice"),
                textAlign: TextAlign.start,
                decoration: InputDecoration(labelText: "ProductPrice"),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: (value) {
                  if (value == null ||
                      value.isEmpty /*RegExp(r'^[0-9]+$').hasMatch(value)*/) {
                    return 'Enter correct ProductSize';
                  } else {
                    return null;
                  }
                },
                controller: addProductsController.otherProductPrice,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                key: const ValueKey("ProductDescription"),
                textAlign: TextAlign.start,
                decoration: InputDecoration(labelText: "ProductDescription"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter correct ProductDescription';
                  } else {
                    return null;
                  }
                },
                controller: addProductsController.otherProductDescription,
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
