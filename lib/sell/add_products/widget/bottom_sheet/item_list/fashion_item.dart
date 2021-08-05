import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/data/bottom_sheet/item_category/fashion.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';

class FashionList extends StatefulWidget {
  const FashionList({Key key}) : super(key: key);

  @override
  _FashionListState createState() => _FashionListState();
}

class _FashionListState extends State<FashionList> {
  AddProductsController addProductsController =
      Get.put(AddProductsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: Fashion.all
          .map((clothItemE) => GestureDetector(
                onTap: () {
                  setState(() {
                    addProductsController.itemElement = clothItemE;
                    //addProductsController.initialIndex = 0;
                    //TODO
                    print(clothItemE.title);
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  height: Get.height * 0.07,
                  width: Get.width * 0.3,
                  decoration: BoxDecoration(
                      color: addProductsController.itemElement == clothItemE
                          ? Colors.blue
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                      child: Text(
                    clothItemE.title,
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ))
          .toList(),
    );
  }
}
