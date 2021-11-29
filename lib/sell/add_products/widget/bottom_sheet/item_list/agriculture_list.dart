import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';
import 'package:shopping_app/sell/data/bottom_sheet/item_category/agriculture.dart';

class AgricultureList extends StatefulWidget {
  const AgricultureList({Key key}) : super(key: key);

  @override
  _AgricultureListState createState() => _AgricultureListState();
}

class _AgricultureListState extends State<AgricultureList> {
  AddProductsController addProductsController =
      Get.put(AddProductsController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: Agriculture.all
          .map((agricultureE) => GestureDetector(
                onTap: () {
                  setState(() {
                    addProductsController.itemElement = agricultureE;
                    //addProductsController.initialIndex = 0;
                    //TODO
                    print(agricultureE.title);
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  height: Get.height * 0.07,
                  width: Get.width * 0.3,
                  decoration: BoxDecoration(
                      color: addProductsController.itemElement == agricultureE
                          ? Colors.blue
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                      child: Text(
                    agricultureE.title,
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ))
          .toList(),
    );
  }
}
