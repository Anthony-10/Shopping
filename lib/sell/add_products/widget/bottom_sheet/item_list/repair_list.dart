import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/data/bottom_sheet/item_category/repair.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';

class RepairList extends StatefulWidget {
  const RepairList({Key key}) : super(key: key);

  @override
  _RepairListState createState() => _RepairListState();
}

class _RepairListState extends State<RepairList> {
  AddProductsController addProductsController =
      Get.put(AddProductsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: Repair.all
          .map((repairE) => GestureDetector(
                onTap: () {
                  setState(() {
                    addProductsController.itemElement = repairE;
                    //addProductsController.initialIndex = 0;
                    //TODO
                    print(repairE.title);
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  height: Get.height * 0.07,
                  width: Get.width * 0.3,
                  decoration: BoxDecoration(
                      color: addProductsController.itemElement == repairE
                          ? Colors.blue
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                      child: Text(
                    repairE.title,
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ))
          .toList(),
    );
  }
}
