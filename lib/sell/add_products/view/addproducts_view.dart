import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_app/data/add_product/add_product.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';
import 'package:shopping_app/sell/add_products/widget/bottom_sheet.dart';
import 'package:shopping_app/sell/add_products/widget/bottom_sheet2.dart';

class AddProductsView extends StatefulWidget {
  AddProductsView({
    Key key,
  }) : super(key: key);

  @override
  _AddProductsViewState createState() => _AddProductsViewState();
}

class _AddProductsViewState extends State<AddProductsView> {

  final addProductsController = Get.put(AddProductsController());


  final bottomSheetView = Get.put(BottomSheetView());


  bool value = false;

  ValueChanged<ProductItems> onClickProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () {
          Get.bottomSheet(Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            height: 100.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: const Icon(
                      Icons.camera_alt,
                      size: 30.0,
                    ),
                    onPressed: () {
                      addProductsController.getImageCamera(ImageSource.camera);
                      Get.back();
                    }),
                IconButton(
                    icon: const Icon(Icons.camera_roll_sharp, size: 30.0),
                    onPressed: () {
                      addProductsController
                          .getImageGallery(ImageSource.gallery);
                      Get.back();
                    })
              ],
            ),
          ));
        },
      ),
      body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  child: Center(
                      /*child: Text(
                      "Add Product",
                      style: TextStyle(fontSize: 20.0),
                    ),*/
                      ),
                  height: 30.0,
                ),
                Obx(() => addProductsController.image.isNotEmpty
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Row(
                          children: addProductsController.image
                              .map((element) => SizedBox(
                                    height: Get.height * 0.5,
                                    width: Get.width * 0.7,
                                    child: Card(
                                      semanticContainer: true,
                                      clipBehavior: Clip.antiAlias,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Image.file(element,
                                          fit: BoxFit.fill,
                                          height: Get.height * 0.5,
                                          width: Get.width * 0.7),
                                      color: Colors.white70,
                                      elevation: 3.0,
                                      margin: EdgeInsets.all(5.0),
                                    ),
                                  ))
                              .toList(),
                        ),
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Row(
                            children: AddProductItems.all
                                .map(
                                  (item) => SizedBox(
                                    height: Get.height * 0.5,
                                    width: Get.width * 0.7,
                                    child: Card(
                                      semanticContainer: true,
                                      clipBehavior: Clip.antiAlias,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Center(
                                          child: Text(
                                        item.name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                      color: Colors.white70,
                                      elevation: 3.0,
                                      margin: EdgeInsets.all(5.0),
                                    ),
                                  ),
                                )
                                .toList()),
                      )),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  'Enter Three Dimension Of Your Products',
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(
                  height: 60.0,
                ),
                SizedBox(
                    width: Get.width * 0.6,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.bottomSheet(
                              BottomSheet2(),
                              isDismissible: false,
                            );
                          },
                          child: Text('Continue'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                          ),
                        )
                      ],
                    ))
              ],
            ),
          )),
    );
  }
}