import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';
import 'package:shopping_app/sell/data/bottom_sheet/item_category/office.dart';

class OfficeList extends StatefulWidget {
  const OfficeList({Key key}) : super(key: key);

  @override
  _OfficeListState createState() => _OfficeListState();
}

class _OfficeListState extends State<OfficeList> {
  AddProductsController addProductsController =
      Get.put(AddProductsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: Office.all
          .map((officeE) => GestureDetector(
                onTap: () {
                  setState(() {
                    addProductsController.itemElement = officeE;
                    //addProductsController.initialIndex = 0;
                    //TODO
                    print(officeE.title);
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  height: Get.height * 0.07,
                  width: Get.width * 0.3,
                  decoration: BoxDecoration(
                      color: addProductsController.itemElement == officeE
                          ? Colors.blue
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                      child: Text(
                    officeE.title,
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ))
          .toList(),
    );
  }
}
