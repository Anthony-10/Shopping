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
import 'package:shopping_app/models/check_box_item.dart';
import 'package:shopping_app/models/item_model.dart';
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
  final TextEditingController _productName = TextEditingController();
  final TextEditingController _productSize = TextEditingController();

  ProductItems productElement;
  ItemModel itemElement;

  //CheckBoxItem value;
  int initialIndex1 = 0;
  AddProductsController addProductsController =
      Get.put(AddProductsController());
  //bool value = false;
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
                                        this.productElement = element;
                                        //addProductsController.initialIndex = 1;
                                      });
                                      print(element.obs);
                                      print(element.title);
                                      print(
                                          '************************${this.productElement.title}');
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(10.0),
                                      padding: EdgeInsets.all(10.0),
                                      height: Get.height * 0.07,
                                      width: Get.width * 0.3,
                                      decoration: BoxDecoration(
                                          color: this.productElement == element
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
                          ? getPage(productElement)
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
                                          value: e.value,
                                          onChanged: (unValue) {
                                            setState(() {
                                              e.value = unValue;
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
                        addProductsController.initialIndex == 0 &&
                                this.productElement != null
                            ? setState(() {
                                addProductsController.initialIndex = 1;
                              })
                            : addProductsController.initialIndex == 1 &&
                                    this.productElement != null &&
                                    this.itemElement != null
                                ? setState(() {
                                    addProductsController.initialIndex = 2;
                                  })
                                : this.productElement == null
                                    ? Get.snackbar('Massage', 'Select product',
                                        snackPosition: SnackPosition.BOTTOM)
                                    : this.itemElement == null
                                        ? Get.snackbar('Massage', 'Select Item',
                                            snackPosition: SnackPosition.BOTTOM)
                                        : setState(() {
                                            addProductsController.initialIndex =
                                                0;
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
              .map((vehiclesE) => GestureDetector(
                    onTap: () {
                      setState(() {
                        //addProductsController.initialIndex = 0;
                        this.itemElement = vehiclesE;
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
                          color: this.itemElement == vehiclesE
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
      case ProductCategories.sports:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: Sports.all
              .map((sportsE) => GestureDetector(
                    onTap: () {
                      setState(() {
                        this.itemElement = sportsE;
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
                          color: this.itemElement == sportsE
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
      case ProductCategories.repair:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: Repair.all
              .map((repairE) => GestureDetector(
                    onTap: () {
                      setState(() {
                        this.itemElement = repairE;
                        //addProductsController.initialIndex = 0;
                        //TODO
                        print(repairE.title);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      height: Get.height * 0.07,
                      width: Get.width * 0.3,
                      decoration: BoxDecoration(
                          color: this.itemElement == repairE
                              ? Colors.blue
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Center(
                          child: Text(
                        repairE.title,
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
              .map((houseE) => GestureDetector(
                    onTap: () {
                      setState(() {
                        this.itemElement = houseE;
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
                          color: this.itemElement == houseE
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
      case ProductCategories.agriculture:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: Agriculture.all
              .map((agricultureE) => GestureDetector(
                    onTap: () {
                      setState(() {
                        this.itemElement = agricultureE;
                        //addProductsController.initialIndex = 0;
                        //TODO
                        print(agricultureE.title);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      height: Get.height * 0.07,
                      width: Get.width * 0.3,
                      decoration: BoxDecoration(
                          color: this.itemElement == agricultureE
                              ? Colors.blue
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Center(
                          child: Text(
                        agricultureE.title,
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
              .map((petsE) => GestureDetector(
                    onTap: () {
                      setState(() {
                        this.itemElement = petsE;
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
                          color: this.itemElement == petsE
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
      case ProductCategories.electronics:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: Electronics.all
              .map((electronicsE) => GestureDetector(
                    onTap: () {
                      setState(() {
                        this.itemElement = electronicsE;
                        //addProductsController.initialIndex = 0;
                        //TODO
                        print(electronicsE.title);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      height: Get.height * 0.07,
                      width: Get.width * 0.3,
                      decoration: BoxDecoration(
                          color: this.itemElement == electronicsE
                              ? Colors.blue
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Center(
                          child: Text(
                        electronicsE.title,
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
              .map((healthE) => GestureDetector(
                    onTap: () {
                      setState(() {
                        this.itemElement = healthE;
                        //addProductsController.initialIndex = 0;
                        //TODO
                        print(healthE.title);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      height: Get.height * 0.07,
                      width: Get.width * 0.3,
                      decoration: BoxDecoration(
                          color: this.itemElement == healthE
                              ? Colors.blue
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Center(
                          child: Text(
                        healthE.title,
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
              .map((officeE) => GestureDetector(
                    onTap: () {
                      setState(() {
                        this.itemElement = officeE;
                        //addProductsController.initialIndex = 0;
                        //TODO
                        print(officeE.title);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      height: Get.height * 0.07,
                      width: Get.width * 0.3,
                      decoration: BoxDecoration(
                          color: this.itemElement == officeE
                              ? Colors.grey
                              : Colors.blue,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Center(
                          child: Text(
                        officeE.title,
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ))
              .toList(),
        );
      case ProductCategories.others:
        //TODO
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            //margin: EdgeInsets.only(left: 5),
            padding: EdgeInsets.only(left: 5, bottom: 100),
            //height: Get.height * 0.07,
            width: Get.width * 0.4,
            child: Column(
              children: [
                TextFormField(
                  key: const ValueKey("ProductName"),
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: "ProductName",
                  ),
                  controller: _productName,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  key: const ValueKey("ProductSize"),
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: "ProductSize",
                  ),
                  controller: _productSize,
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(onPressed: () {}, child: Text('Add Product')),
              ],
            ),
          )
        ]);

      case ProductCategories.fashion:
      default:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: ClothItem.all
              .map((clothItemE) => GestureDetector(
                    onTap: () {
                      setState(() {
                        this.itemElement = clothItemE;
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
                          color: this.itemElement == clothItemE
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
}
