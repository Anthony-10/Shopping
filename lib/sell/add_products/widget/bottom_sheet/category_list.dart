import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';
import 'package:shopping_app/sell/data/bottom_sheet/product_category.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  AddProductsController addProductsController =
      Get.put(AddProductsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ProductCategories.all
          .map((element) => GestureDetector(
                onTap: () {
                  setState(() {
                    addProductsController.productElement = element;
                    //addProductsController.initialIndex = 1;
                  });
                  print(element.obs);
                  print(element.title);
                  print(
                      '************************${addProductsController.productElement.title}');
                },
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  height: Get.height * 0.07,
                  width: Get.width * 0.3,
                  decoration: BoxDecoration(
                      color: addProductsController.productElement == element
                          ? Colors.blue
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                      child: Text(
                    element.title,
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ))
          .toList(),
    );
  }
}
