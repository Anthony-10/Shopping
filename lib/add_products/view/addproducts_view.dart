import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_app/add_products/controller/addproducts_controller.dart';
import 'package:shopping_app/data/add_product/add_product.dart';

class AddProductsView extends StatefulWidget {
  const AddProductsView({Key key}) : super(key: key);

  @override
  _AddProductsViewState createState() => _AddProductsViewState();
}

class _AddProductsViewState extends State<AddProductsView> {
  final TextEditingController _productName = TextEditingController();
  final TextEditingController _productSize = TextEditingController();

  final addProductsController = Get.find<AddProductsController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _skip();
  }

  bool value = false;

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
                    child: Text(
                      "Add Product",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  height: 40.0,
                ),
                Obx(() =>
                addProductsController.image.isNotEmpty
                    ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: addProductsController.image
                        .map((element) =>
                        SizedBox(
                          height: Get.height * 0.5,
                          width: Get.width * 0.6,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(10.0)),
                            child: Image.file(element,
                                fit: BoxFit.cover,
                                height: Get.height * 0.5,
                                width: Get.width * 0.5),
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
                            (item) =>
                            SizedBox(
                              height: Get.height * 0.5,
                              width: Get.width * 0.6,
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
                SizedBox(
                    width: Get.width * 0.6,
                    child: Column(
                      children: [
                        TextFormField(
                          key: const ValueKey("productName"),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "productName",
                          ),
                          keyboardType: TextInputType.text,
                          controller: _productName,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          key: const ValueKey("productSize"),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "productSize",
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: _productSize,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextButton(
                            onPressed: () {
                              if (_productName.text.isNotEmpty &&
                                  _productSize.text.isNotEmpty) {
                                addProductsController.addProducts(
                                    _productName.text, _productSize.text);
                                Get.snackbar(
                                    'message', 'product details added');
                              } else if (_productName.text.isEmpty) {
                                Get.snackbar('message', 'Enter ProductName');
                              } else {
                                if (_productSize.text.isEmpty) {
                                  Get.snackbar('message', 'Enter ProductSize');
                                }
                              }
                            },
                            child: Text('Add Product'))
                      ],
                    ))
              ],
            ),
          )),
    );
  }

  getBottomSheet() {
    Get.bottomSheet(Container(height: 50.0, decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20))),
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.red,
        value: value,
        title: Text('mA'),
        /*onChanged: (value) => ,*/
      ),));
  }

  void _skip() async {
    final timer = Timer(Duration(microseconds: 2000), () async {
      print('something happens here');
      getBottomSheet();
    });
  }
}