import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/data/bottom_sheet/check_box_category.dart';
import 'package:shopping_app/data/bottom_sheet/item_category/agriculture.dart';
import 'package:shopping_app/data/bottom_sheet/item_category/electronics.dart';
import 'package:shopping_app/data/bottom_sheet/item_category/fashion.dart';
import 'package:shopping_app/data/bottom_sheet/item_category/health.dart';
import 'package:shopping_app/data/bottom_sheet/item_category/house.dart';
import 'package:shopping_app/data/bottom_sheet/item_category/office.dart';
import 'package:shopping_app/data/bottom_sheet/item_category/pets.dart';
import 'package:shopping_app/data/bottom_sheet/item_category/repair.dart';
import 'package:shopping_app/data/bottom_sheet/item_category/sports.dart';
import 'package:shopping_app/data/bottom_sheet/item_category/vehicles.dart';
import 'package:shopping_app/data/bottom_sheet/product_category.dart';
import 'package:shopping_app/models/product_items.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';
import 'package:shopping_app/sell/add_products/widget/others.dart';

class BottomSheet2 extends StatefulWidget {
  const BottomSheet2({Key key}) : super(key: key);

  @override
  _BottomSheet2State createState() => _BottomSheet2State();
}

class _BottomSheet2State extends State<BottomSheet2> {
  //ProductItems element = ProductCategories.all;
  ProductItems element;
  int initialIndex1 = 0;
  AddProductsController addProductsController =
      Get.put(AddProductsController());
  bool value = false;
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
                      ? Text(
                          'Select a category',
                          style: TextStyle(fontSize: 20.0),
                        )
                      : addProductsController.initialIndex == 1
                          ? Text(
                              'Select a item',
                              style: TextStyle(fontSize: 20.0),
                            )
                          : Text(
                              'Select size',
                              style: TextStyle(fontSize: 20.0),
                            ),
                  SizedBox(
                    height: 30.0,
                  ),
                  addProductsController.initialIndex == 0
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: ProductCategories.all
                              .map((element) => GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        this.element = element;
                                        //addProductsController.initialIndex = 1;
                                      });
                                      print(element.obs);
                                      print(element.title);
                                      print(
                                          '************************${this.element.title}');
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(10.0),
                                      padding: EdgeInsets.all(10.0),
                                      height: Get.height * 0.07,
                                      width: Get.width * 0.3,
                                      decoration: BoxDecoration(
                                          color: this.element == element
                                              ? Colors.blue
                                              : Colors.grey,
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
                      : addProductsController.initialIndex == 1
                          ? getPage(element)
                          : SingleChildScrollView(
                              child: Container(
                                width: Get.width * 0.4,
                                child: Wrap(
                                  children: CheckBoxCategories.all
                                      .map(
                                        (e) => CheckboxListTile(
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          activeColor: Colors.blue,
                                          title: Text(e.text),
                                          value: value,
                                          onChanged: (value) {
                                            setState(() {
                                              this.value = !value;
                                            });
                                          },
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        addProductsController.initialIndex == 0
                            ? setState(() {
                                addProductsController.initialIndex = 1;
                              })
                            : addProductsController.initialIndex == 1
                                ? setState(() {
                                    addProductsController.initialIndex = 2;
                                  })
                                : setState(() {
                                    addProductsController.initialIndex = 0;
                                  });
                      },
                      child: Text('save'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          addProductsController.initialIndex = 0;
                        });
                      },
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
    );
  }

  Widget getPage(element) {
    switch (element) {
      case ProductCategories.vehicle:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: Vehicles.all
              .map((element1) => GestureDetector(
                    onTap: () {
                      setState(() {
                        //addProductsController.initialIndex = 0;
                        this.element = element1;
                        //TODO
                        print(element1.title);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      height: Get.height * 0.07,
                      width: Get.width * 0.3,
                      decoration: BoxDecoration(
                          color: this.element == element1
                              ? Colors.blue
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Center(
                          child: Text(
                        element1.title,
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ))
              .toList(),
        );
      case ProductCategories.sports:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: Sports.all
              .map((element) => GestureDetector(
                    onTap: () {
                      setState(() {
                        this.element = element;
                        //addProductsController.initialIndex = 0;
                        //TODO
                        print(element.title);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      height: Get.height * 0.07,
                      width: Get.width * 0.3,
                      decoration: BoxDecoration(
                          color: this.element == element
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
      case ProductCategories.repair:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: Repair.all
              .map((element) => GestureDetector(
                    onTap: () {
                      setState(() {
                        this.element = element;
                        //addProductsController.initialIndex = 0;
                        //TODO
                        print(element.title);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      height: Get.height * 0.07,
                      width: Get.width * 0.3,
                      decoration: BoxDecoration(
                          color: this.element == element
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
      case ProductCategories.house:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: House.all
              .map((element) => GestureDetector(
                    onTap: () {
                      setState(() {
                        this.element = element;
                        //addProductsController.initialIndex = 0;
                        //TODO
                        print(element.title);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      height: Get.height * 0.07,
                      width: Get.width * 0.3,
                      decoration: BoxDecoration(
                          color: this.element == element
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
      case ProductCategories.agriculture:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: Agriculture.all
              .map((element) => GestureDetector(
                    onTap: () {
                      setState(() {
                        this.element = element;
                        //addProductsController.initialIndex = 0;
                        //TODO
                        print(element.title);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      height: Get.height * 0.07,
                      width: Get.width * 0.3,
                      decoration: BoxDecoration(
                          color: this.element == element
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
      case ProductCategories.pets:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: Pets.all
              .map((element) => GestureDetector(
                    onTap: () {
                      setState(() {
                        this.element = element;
                        //addProductsController.initialIndex = 0;
                        //TODO
                        print(element.title);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      height: Get.height * 0.07,
                      width: Get.width * 0.3,
                      decoration: BoxDecoration(
                          color: this.element == element
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
      case ProductCategories.electronics:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: Electronics.all
              .map((element) => GestureDetector(
                    onTap: () {
                      setState(() {
                        this.element = element;
                        //addProductsController.initialIndex = 0;
                        //TODO
                        print(element.title);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      height: Get.height * 0.07,
                      width: Get.width * 0.3,
                      decoration: BoxDecoration(
                          color: this.element == element
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
      case ProductCategories.health:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: Health.all
              .map((element) => GestureDetector(
                    onTap: () {
                      setState(() {
                        this.element = element;
                        //addProductsController.initialIndex = 0;
                        //TODO
                        print(element.title);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      height: Get.height * 0.07,
                      width: Get.width * 0.3,
                      decoration: BoxDecoration(
                          color: this.element == element
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
      case ProductCategories.office:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: Office.all
              .map((element) => GestureDetector(
                    onTap: () {
                      setState(() {
                        this.element = element;
                        //addProductsController.initialIndex = 0;
                        //TODO
                        print(element.title);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      height: Get.height * 0.07,
                      width: Get.width * 0.3,
                      decoration: BoxDecoration(
                          color: this.element == element
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
      case ProductCategories.others:
        //TODO
        return Others();

      case ProductCategories.fashion:
      default:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: ClothItem.all
              .map((e) => GestureDetector(
                    onTap: () {
                      setState(() {
                        this.element = e;
                        //addProductsController.initialIndex = 0;
                        //TODO
                        print(element.title);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      height: Get.height * 0.07,
                      width: Get.width * 0.3,
                      decoration: BoxDecoration(
                          color: this.element == e ? Colors.blue : Colors.grey,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Center(
                          child: Text(
                        e.title,
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ))
              .toList(),
        );
    }
  }
}
