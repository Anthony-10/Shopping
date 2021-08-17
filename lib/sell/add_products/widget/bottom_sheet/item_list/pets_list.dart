import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';
import 'package:shopping_app/sell/data/bottom_sheet/item_category/pets.dart';

class PetsList extends StatefulWidget {
  const PetsList({Key key}) : super(key: key);

  @override
  _PetsListState createState() => _PetsListState();
}

class _PetsListState extends State<PetsList> {
  AddProductsController addProductsController =
      Get.put(AddProductsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: Pets.all
          .map((petsE) => GestureDetector(
                onTap: () {
                  setState(() {
                    addProductsController.itemElement = petsE;
                    //addProductsController.initialIndex = 0;
                    //TODO
                    print(petsE.title);
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  height: Get.height * 0.07,
                  width: Get.width * 0.3,
                  decoration: BoxDecoration(
                      color: addProductsController.itemElement == petsE
                          ? Colors.blue
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                      child: Text(
                    petsE.title,
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ))
          .toList(),
    );
  }
}
