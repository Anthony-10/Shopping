import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/service/data_base_service.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';
import 'package:shopping_app/sell/data/bottom_sheet/product_category.dart';
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
  final AddProductsController addProductsController =
      Get.put(AddProductsController());
  final DatabaseService databaseService = Get.put(DatabaseService());
  var height = Get.height;
  var width = Get.width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * .9,
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 30),
        child: Column(
          children: [
            Container(
              height: height * 0.06,
              child: Icon(
                Icons.keyboard_arrow_up,
                size: 40,
              ),
            ),
            Expanded(
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
                              : addProductsController.initialIndex == 1 &&
                                      addProductsController.productElement !=
                                          ProductCategories.others
                                  ? Text(
                                      'Select a item',
                                      style: TextStyle(fontSize: 20.0),
                                    )
                                  : addProductsController.initialIndex == 1 &&
                                          addProductsController
                                                  .productElement ==
                                              ProductCategories.others
                                      ? Text(
                                          'Write',
                                          style: TextStyle(fontSize: 20.0),
                                        )
                                      : addProductsController.initialIndex == 2
                                          ? Text(
                                              'Select Price',
                                              style: TextStyle(fontSize: 20.0),
                                            )
                                          : Text(
                                              'Fill the blanks',
                                              style: TextStyle(fontSize: 20.0),
                                            )),
                      SizedBox(
                        height: height * .04,
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
                                      ? getPage(
                                          addProductsController.productElement)
                                      : PriceSection()

                              /*: addProductsController
                                                      .initialIndex ==
                                                  3
                                              ? ColorChekBox()
                                              : PriceSection()*/
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
                              //addProductsController.userImage();
                              validation();
                            },
                            child: Text('save'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: width * .05,
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

  Future<void> validation() async {
    addProductsController.initialIndex == 0 &&
            addProductsController.productElement != null
        ? setState(() {
            addProductsController.initialIndex = 1;
          })
        : addProductsController.initialIndex == 1 &&
                /* addProductsController.productElement ==
                    ProductCategories.fashion &&*/
                addProductsController.productElement != null &&
                addProductsController.itemElement != null
            ? setState(() {
                addProductsController.initialIndex = 2;
              })
            /*: addProductsController.initialIndex == 2 &&
                    addProductsController.productElement != null &&
                    addProductsController.itemElement != null
                ? setState(() {
                    addProductsController.initialIndex = 3;
                  })*/
            : addProductsController.initialIndex == 2 &&
                    addProductsController.productElement != null &&
                    addProductsController.itemElement != null &&
                    addProductsController.productElement !=
                        ProductCategories.others &&
                    addProductsController.formKey.currentState.validate()
                ? setState(() {
                    addProductsController.initialIndex = 3;
                  })
                : addProductsController.initialIndex == 3
                    ? uploadPicks().whenComplete(() => Navigator.pop(context))
                    : addProductsController.productElement == null
                        ? Get.snackbar('Massage', 'Select product',
                            snackPosition: SnackPosition.TOP)
                        : addProductsController.itemElement == null
                            ? Get.snackbar('Massage', 'Select Item',
                                snackPosition: SnackPosition.TOP)
                            : Get.snackbar('Massage', 'Fill the blanks',
                                snackPosition: SnackPosition.TOP);
  }

  Future<void> uploadPicks() async {
    if (databaseService.fileURLList.isNotEmpty) {
      databaseService.userProducts(
        productElement: addProductsController.productElement.title.toString(),
        itemElement: addProductsController.itemElement.title.toString(),
        checkBoxElement: addProductsController.checkBoxElement.toString(),
        colorElement: addProductsController.colorElement.toString(),
        url: databaseService.fileURLList,
        productName: addProductsController.productName.text,
        productSize: addProductsController.productSize.text,
        productAmount: addProductsController.productAmount.text,
        otherProductPrice: addProductsController.otherProductPrice.text,
        otherProductDescription:
            addProductsController.otherProductDescription.text,
      );
    } else {
      Get.snackbar('Massage', 'Select Product',
          snackPosition: SnackPosition.TOP);
      print('fileURLList null');
    }
  }
}
