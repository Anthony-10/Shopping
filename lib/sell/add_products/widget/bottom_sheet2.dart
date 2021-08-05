import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/data/bottom_sheet/color_data.dart';
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
import 'package:shopping_app/models/item_model.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';

import 'bottom_sheet/category_list.dart';
import 'bottom_sheet/color_check_box.dart';
import 'bottom_sheet/item_list/agriculture_list.dart';
import 'bottom_sheet/item_list/electronics_list.dart';
import 'bottom_sheet/item_list/fashion_item.dart';
import 'bottom_sheet/item_list/health_list.dart';
import 'bottom_sheet/item_list/house_list.dart';
import 'bottom_sheet/item_list/office_list.dart';
import 'bottom_sheet/item_list/other_list.dart';
import 'bottom_sheet/item_list/pets_list.dart';
import 'bottom_sheet/item_list/repair_list.dart';
import 'bottom_sheet/item_list/sport_list.dart';
import 'bottom_sheet/item_list/vehicle_list.dart';
import 'bottom_sheet/price_section.dart';
import 'bottom_sheet/size_check_box.dart';

class BottomSheet2 extends StatefulWidget {
  const BottomSheet2({Key key}) : super(key: key);

  @override
  _BottomSheet2State createState() => _BottomSheet2State();
}

class _BottomSheet2State extends State<BottomSheet2> {
  //ProductItems element = ProductCategories.all;
  final TextEditingController _productName = TextEditingController();
  final TextEditingController _productSize = TextEditingController();
  final TextEditingController _productPrice = TextEditingController();
  final TextEditingController _productDescription = TextEditingController();
  final TextEditingController _otherProductPrice = TextEditingController();
  final TextEditingController _otherProductDescription =
      TextEditingController();

  //ProductItems productElement;
  ItemModel itemElement;
  //CheckBoxItem checkBoxElement;
  /*var checkBoxElement;
  bool checkBoxValue = false;*/

  /*var colorElement;
  bool colorValue = false;*/

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
            Column(
              children: [
                Container(
                  child: addProductsController.initialIndex == 0
                      ? Text(
                          'Select a category',
                          style: TextStyle(fontSize: 20.0),
                        )
                      : addProductsController.initialIndex == 1
                          ? Text(
                              'Select a item',
                              style: TextStyle(fontSize: 20.0),
                            )
                          : addProductsController.initialIndex == 2
                              ? Text(
                                  'Select size',
                                  style: TextStyle(fontSize: 20.0),
                                )
                              : addProductsController.initialIndex == 3
                                  ? Text(
                                      'Select Color',
                                      style: TextStyle(fontSize: 20.0),
                                    )
                                  : Text(
                                      'Select Price',
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        addProductsController.initialIndex == 0
                            ? CategoryList()
                            : addProductsController.initialIndex == 1
                                ? getPage(addProductsController.productElement)
                                : addProductsController.initialIndex == 2
                                    ? SizeCheckBox()
                                    : addProductsController.initialIndex == 3
                                        ? ColorChekBox()
                                        : PriceSection()
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        addProductsController.initialIndex == 0 &&
                                addProductsController.productElement != null
                            ? setState(() {
                                addProductsController.initialIndex = 1;
                              })
                            : addProductsController.initialIndex == 1 &&
                                    addProductsController.productElement ==
                                        ProductCategories.fashion
                                ? setState(() {
                                    addProductsController.initialIndex = 2;
                                  })
                                : addProductsController.initialIndex == 2 &&
                                        addProductsController.productElement !=
                                            null &&
                                        addProductsController.itemElement !=
                                            null
                                    ? setState(() {
                                        addProductsController.initialIndex = 3;
                                      })
                                    : addProductsController.initialIndex == 3 ||
                                            addProductsController
                                                        .initialIndex ==
                                                    1 &&
                                                addProductsController
                                                        .productElement !=
                                                    ProductCategories.others
                                        ? setState(() {
                                            addProductsController.initialIndex =
                                                4;
                                          })
                                        : addProductsController
                                                    .productElement ==
                                                null
                                            ? Get.snackbar(
                                                'Massage', 'Select product',
                                                snackPosition:
                                                    SnackPosition.BOTTOM)
                                            : addProductsController
                                                        .itemElement ==
                                                    null
                                                ? Get.snackbar(
                                                    'Massage', 'Select Item',
                                                    snackPosition:
                                                        SnackPosition.BOTTOM)
                                                : Get.back();
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
        return VehicleList();
      case ProductCategories.sports:
        return SportList();
      case ProductCategories.repair:
        return RepairList();
      case ProductCategories.house:
        return HouseList();
      case ProductCategories.agriculture:
        return AgricultureList();
      case ProductCategories.pets:
        return PetsList();
      case ProductCategories.electronics:
        return ElectronicsList();
      case ProductCategories.health:
        return HealthList();
      case ProductCategories.office:
        return OfficeList();
      case ProductCategories.others:
        return OtherList();

      case ProductCategories.fashion:
      default:
        return FashionList();
    }
  }
}
