/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/data/item_category/cloth_item.dart';
import 'package:shopping_app/data/product_category/product_category.dart';
import 'package:shopping_app/models/product_items.dart';

class BottomSheetView extends GetxController {
  final ValueChanged<ProductItems> onClick;
  BottomSheetView({this.onClick});

  ProductItems element = ProductCategories.clothes;

  getBottomSheet() {
    Get.bottomSheet(
        Container(
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
                              onClick(element);
                              this.element = element.obs as ProductItems;
                              Get.back();
                              */
/* setState(() {
                        //TODO
                        this.element = element;
                        print(element.title);
                        //widget.onSelectedProduct(element);
                        Get.back();
                      });*//*

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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[Obx(()=> PagetoShow())]


                  ),
            ),
        ],
      ),
    ));
  }

  PagetoShow() {
    switch (element) {
      case ProductCategories.clothes:
      default:
        */
/*Container(
        margin: EdgeInsets.all(15.0), child: Text('Select a Item')),*//*

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: ClothItem.all
              .map((cloth) => GestureDetector(
                    onTap: () {
                      print(cloth.title);
                      */
/*setState(() {
                        Get.back();
                        //TODO
                        print(element.title);
                      });*//*

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
                        cloth.title,
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ))
              .toList(),
        );
    }
  }
}
*/
