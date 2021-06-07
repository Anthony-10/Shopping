import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_app/add_products/controller/addproducts_controller.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: true,
          child: Column(
            children: [
              Container(
                child: Center(
                    child: Text(
                  "Add Product",
                  style: TextStyle(fontSize: 20.0),
                )),
                height: 40.0,
              ),
              Container(
                height: 200.0,
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        //height: MediaQuery.of(context).size.height,
                        //width: MediaQuery.of(context).size.width,
                        height: Get.height,
                        width: Get.width,
                        child: Card(
                          child:
                              Obx(() => addProductsController.image.isNotEmpty
                                  ? Image.file(
                                      addProductsController.image.value,
                                      fit: BoxFit.cover,
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        Get.bottomSheet(Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20))),
                                          height: 100.0,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              IconButton(
                                                  icon: const Icon(
                                                    Icons.camera_alt,
                                                    size: 30.0,
                                                  ),
                                                  onPressed: () {
                                                    addProductsController
                                                        .getImageCamera(
                                                            ImageSource.camera);
                                                    Get.back();
                                                  }),
                                              IconButton(
                                                  icon: const Icon(
                                                      Icons.camera_roll_sharp,
                                                      size: 30.0),
                                                  onPressed: () {
                                                    addProductsController
                                                        .getImageGallery(
                                                            ImageSource
                                                                .gallery);
                                                    Get.back();
                                                  })
                                            ],
                                          ),
                                        ));
                                      },
                                      icon: Icon(Icons.add))),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        //height: MediaQuery.of(context).size.height,
                        //width: MediaQuery.of(context).size.width,
                        height: Get.height,
                        width: Get.width,
                        child: Card(
                          child: Obx(() => addProductsController
                                  .image.value.isNotEmpty
                              ? Image.file(
                                  addProductsController.image.value,
                                  fit: BoxFit.cover,
                                )
                              : IconButton(
                                  onPressed: () {
                                    Get.bottomSheet(Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20))),
                                      height: 100.0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          IconButton(
                                              icon: const Icon(
                                                Icons.camera_alt,
                                                size: 30.0,
                                              ),
                                              onPressed: () {
                                                addProductsController
                                                    .getImageCamera(
                                                        ImageSource.camera);
                                                Get.back();
                                              }),
                                          IconButton(
                                              icon: const Icon(
                                                  Icons.camera_roll_sharp,
                                                  size: 30.0),
                                              onPressed: () {
                                                addProductsController
                                                    .getImageGallery(
                                                        ImageSource.gallery);
                                                Get.back();
                                              })
                                        ],
                                      ),
                                    ));
                                  },
                                  icon: Icon(Icons.add))),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        //height: MediaQuery.of(context).size.height,
                        //width: MediaQuery.of(context).size.width,
                        height: Get.height,
                        width: Get.width,
                        child: Card(
                          child: Obx(() => addProductsController
                                  .image.value.isNotEmpty
                              ? Image.file(
                                  addProductsController.image.value,
                                  fit: BoxFit.cover,
                                )
                              : IconButton(
                                  onPressed: () {
                                    Get.bottomSheet(Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20))),
                                      height: 100.0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          IconButton(
                                              icon: const Icon(
                                                Icons.camera_alt,
                                                size: 30.0,
                                              ),
                                              onPressed: () {
                                                addProductsController
                                                    .getImageCamera(
                                                        ImageSource.camera);
                                                Get.back();
                                              }),
                                          IconButton(
                                              icon: const Icon(
                                                  Icons.camera_roll_sharp,
                                                  size: 30.0),
                                              onPressed: () {
                                                addProductsController
                                                    .getImageGallery(
                                                        ImageSource.gallery);
                                                Get.back();
                                              })
                                        ],
                                      ),
                                    ));
                                  },
                                  icon: Icon(Icons.add))),
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextFormField(
                key: const ValueKey("productName"),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "productName",
                  //fillColor: Colors.grey,
                  //filled: true,
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(30.0),
                  // )
                ),
                keyboardType: TextInputType.text,
                // style: TextStyle(
                //   color: Colors.white,
                // ),
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
                  //fillColor: Colors.grey,
                  //filled: true,
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(30.0),
                  // )
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                // style: TextStyle(
                //   color: Colors.white,
                // ),
                controller: _productSize,
              ),
              TextButton(
                  onPressed: () {
                    if (_productName.text.isNotEmpty &&
                        _productSize.text.isNotEmpty) {
                      addProductsController.addProducts(
                          _productName.text, _productSize.text);
                      Get.snackbar('message', 'product details added');
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
          )),
    );
  }
}
