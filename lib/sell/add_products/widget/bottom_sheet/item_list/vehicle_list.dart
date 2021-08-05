import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/data/bottom_sheet/item_category/vehicles.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';

class VehicleList extends StatefulWidget {
  const VehicleList({Key key}) : super(key: key);

  @override
  _VehicleListState createState() => _VehicleListState();
}

class _VehicleListState extends State<VehicleList> {
  AddProductsController addProductsController =
      Get.put(AddProductsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: Vehicles.all
          .map((vehiclesE) => GestureDetector(
                onTap: () {
                  setState(() {
                    //addProductsController.initialIndex = 0;
                    addProductsController.itemElement = vehiclesE;
                    //TODO
                    print(vehiclesE.title);
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  height: Get.height * 0.07,
                  width: Get.width * 0.3,
                  decoration: BoxDecoration(
                      color: addProductsController.itemElement == vehiclesE
                          ? Colors.blue
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                      child: Text(
                    vehiclesE.title,
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ))
          .toList(),
    );
  }
}
