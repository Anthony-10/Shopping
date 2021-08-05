import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/data/bottom_sheet/item_category/house.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';

class HouseList extends StatefulWidget {
  const HouseList({Key key}) : super(key: key);

  @override
  _HouseListState createState() => _HouseListState();
}

class _HouseListState extends State<HouseList> {
  AddProductsController addProductsController =
      Get.put(AddProductsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: House.all
          .map((houseE) => GestureDetector(
                onTap: () {
                  setState(() {
                    addProductsController.itemElement = houseE;
                    //addProductsController.initialIndex = 0;
                    //TODO
                    print(houseE.title);
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  height: Get.height * 0.07,
                  width: Get.width * 0.3,
                  decoration: BoxDecoration(
                      color: addProductsController.itemElement == houseE
                          ? Colors.blue
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                      child: Text(
                    houseE.title,
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ))
          .toList(),
    );
  }
}
