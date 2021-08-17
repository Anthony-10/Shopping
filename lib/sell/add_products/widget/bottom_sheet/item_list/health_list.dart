import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';
import 'package:shopping_app/sell/data/bottom_sheet/item_category/health.dart';

class HealthList extends StatefulWidget {
  const HealthList({Key key}) : super(key: key);

  @override
  _HealthListState createState() => _HealthListState();
}

class _HealthListState extends State<HealthList> {
  AddProductsController addProductsController =
      Get.put(AddProductsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: Health.all
          .map((healthE) => GestureDetector(
                onTap: () {
                  setState(() {
                    addProductsController.itemElement = healthE;
                    //addProductsController.initialIndex = 0;
                    //TODO
                    print(healthE.title);
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  height: Get.height * 0.07,
                  width: Get.width * 0.3,
                  decoration: BoxDecoration(
                      color: addProductsController.itemElement == healthE
                          ? Colors.blue
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                      child: Text(
                    healthE.title,
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ))
          .toList(),
    );
  }
}
