import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';
import 'package:shopping_app/sell/data/bottom_sheet/item_category/sports.dart';

class SportList extends StatefulWidget {
  const SportList({Key key}) : super(key: key);

  @override
  _SportListState createState() => _SportListState();
}

class _SportListState extends State<SportList> {
  AddProductsController addProductsController =
      Get.put(AddProductsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: Sports.all
          .map((sportsE) => GestureDetector(
                onTap: () {
                  setState(() {
                    addProductsController.itemElement = sportsE;
                    //addProductsController.initialIndex = 0;
                    //TODO
                    print(sportsE.title);
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  height: Get.height * 0.07,
                  width: Get.width * 0.3,
                  decoration: BoxDecoration(
                      color: addProductsController.itemElement == sportsE
                          ? Colors.blue
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                      child: Text(
                    sportsE.title,
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ))
          .toList(),
    );
  }
}
