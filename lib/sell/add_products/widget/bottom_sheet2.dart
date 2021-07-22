import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/data/item_category/car_item.dart';
import 'package:shopping_app/data/item_category/cloth_item.dart';
import 'package:shopping_app/data/product_category/product_category.dart';
import 'package:shopping_app/models/product_items.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';

class BottomSheet2 extends StatefulWidget {
  const BottomSheet2({Key key}) : super(key: key);

  @override
  _BottomSheet2State createState() => _BottomSheet2State();
}

class _BottomSheet2State extends State<BottomSheet2> {
  ProductItems element;
  int initialIndex = 0;
  AddProductsController addProductsController =
      Get.put(AddProductsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      width: Get.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addProductsController.initialIndex == 0
                      ? Text('Select a category')
                      : Text('Select a item'),
                  SizedBox(
                    height: 30.0,
                  ),
                  /*Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: ProductCategories.all
                            .map((element) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      this.element = element;
                                    });
                                    print(element.obs);
                                    print(element.title);
                                    print(
                                        '************************${this.element.title}');
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
                      ),*/
                  addProductsController.initialIndex == 0
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: ProductCategories.all
                              .map((element) => GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        this.element = element;
                                        addProductsController.initialIndex = 1;
                                      });
                                      print(element.obs);
                                      print(element.title);
                                      print(
                                          '************************${this.element.title}');
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(10.0),
                                      height: Get.height * 0.05,
                                      width: Get.width * 0.2,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Center(
                                          child: Text(
                                        element.title,
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ),
                                  ))
                              .toList(),
                        )
                      : getPage(element),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('save'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('back'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),

      // ....................Item List

      /* SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: getPage(element),
          ),*/
    );
  }

  Widget getPage(element) {
    switch (element) {
      case ProductCategories.vehicle:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: CarItem.all
              .map((element) => GestureDetector(
                    onTap: () {
                      setState(() {
                        addProductsController.initialIndex = 0;
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

      case ProductCategories.fashion:
      default:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: ClothItem.all
              .map((element) => GestureDetector(
                    onTap: () {
                      setState(() {
                        addProductsController.initialIndex = 0;

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
