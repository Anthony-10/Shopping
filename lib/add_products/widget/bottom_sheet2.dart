import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/data/item_category/car_item.dart';
import 'package:shopping_app/data/item_category/cloth_item.dart';
import 'package:shopping_app/data/product_category/product_category.dart';
import 'package:shopping_app/models/product_items.dart';

class BottomSheet2 extends StatefulWidget {
  const BottomSheet2({Key key}) : super(key: key);

  @override
  _BottomSheet2State createState() => _BottomSheet2State();
}

class _BottomSheet2State extends State<BottomSheet2> {
  
  ProductItems element = ProductCategories.clothes;
  
  @override
  Widget build(BuildContext context) {
    return  getBottomSheet();
    
  }
   getBottomSheet() {
    Get.bottomSheet(Container(
      height: Get.height,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Row(
        children: [
          // ....................Category List

          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.all(15.0),
                    child: Text('Select a category')),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: ProductCategories.all
                      .map((element) => GestureDetector(
                    onTap: () {
                      this.element = element;
                      print(element.obs);
                      print(element.title);
                      print('************************${this.element.title}');
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      height: Get.height * 0.05,
                      width: Get.width * 0.2,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Center(
                          child: Text(
                            element.title,
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ))
                      .toList(),
                ),
              ],
            ),
          ),

          // ....................Item List

          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: getPage(element),
          ),
        ],
      ),
    ));
  }
  Widget getPage(element) {
    switch (element) {
      case ProductCategories.car:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: CarItem.all
              .map((element) => GestureDetector(
            onTap: () {
              setState(() {
                Get.back();
                //TODO
                print(element.title);
              });
            },
            child: Container(
              margin: EdgeInsets.all(10.0),
              height: Get.height * 0.05,
              width: Get.width * 0.2,
              decoration: BoxDecoration(
                  color: Colors.grey,
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

      case ProductCategories.clothes:
      default:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: ClothItem.all
              .map((element) => GestureDetector(
            onTap: () {
              setState(() {
                Get.back();
                //TODO
                print(element.title);
              });
            },
            child: Container(
              margin: EdgeInsets.all(10.0),
              height: Get.height * 0.05,
              width: Get.width * 0.2,
              decoration: BoxDecoration(
                  color: Colors.grey,
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
}
