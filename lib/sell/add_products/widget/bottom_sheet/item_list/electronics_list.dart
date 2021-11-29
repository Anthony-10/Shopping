import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';
import 'package:shopping_app/sell/data/bottom_sheet/item_category/electronics.dart';

class ElectronicsList extends StatefulWidget {
  const ElectronicsList({Key key}) : super(key: key);

  @override
  _ElectronicsListState createState() => _ElectronicsListState();
}

class _ElectronicsListState extends State<ElectronicsList> {
  AddProductsController addProductsController =
      Get.put(AddProductsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: Electronics.all
          .map((electronicsE) => GestureDetector(
                onTap: () {
                  setState(() {
                    addProductsController.itemElement = electronicsE;
                    //addProductsController.initialIndex = 0;
                    //TODO
                    print(electronicsE.title);
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  height: Get.height * 0.07,
                  width: Get.width * 0.3,
                  decoration: BoxDecoration(
                      color: addProductsController.itemElement == electronicsE
                          ? Colors.blue
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                      child: Text(
                    electronicsE.title,
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ))
          .toList(),
    );
  }
}
