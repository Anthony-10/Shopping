import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/data/bottom_sheet/product_category.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';

class BottomSheets extends StatefulWidget {
  const BottomSheets({Key key}) : super(key: key);

  @override
  _BottomSheetsState createState() => _BottomSheetsState();
}

class _BottomSheetsState extends State<BottomSheets> {
  //ProductItems element;

  AddProductsController addProductsController =
      Get.put(AddProductsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ProductCategories.all
          .map((element) => GestureDetector(
                onTap: () {
                  setState(() {
                    this.addProductsController.element = element;
                    addProductsController.initialIndex = 1;
                  });
                  print(element.obs);
                  print(element.title);
                  print(
                      '************************${this.addProductsController.element.title}');
                },
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  height: Get.height * 0.05,
                  width: Get.width * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                      child: Text(
                    element.title,
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ))
          .toList(),
    );
  }
}
