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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.toNamed("/tab_bar");
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                      Center(
                        child: Text(
                          "Add Product",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ],
                  ),
                  height: 40.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        //height: MediaQuery.of(context).size.height,
                        //width: MediaQuery.of(context).size.width,
                        height: Get.height,
                        width: Get.width,
                        child: Card(
                          child: Obx(() => addProductsController.image != null
                              ? ListView.builder(
                                  itemCount:
                                      addProductsController.image.length,
                                  itemBuilder: (context, index) => Container(
                                    height: Get.height,
                                    width: Get.width,
                                    margin: EdgeInsets.all(8),
                                    child: Image.file(
                                      addProductsController.image[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
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
                          child: Obx(() => addProductsController.image != null
                              ? ListView.builder(
                                  itemCount:
                                      addProductsController.image.length,
                                  itemBuilder: (context, index) => Container(
                                    height: Get.height,
                                    width: Get.width,
                                    margin: EdgeInsets.all(8),
                                    child: Image.file(
                                      addProductsController.image[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
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
                                  .image.isNotEmpty
                              ? ListView.builder(
                                  itemCount:
                                      addProductsController.image.length,
                                  itemBuilder: (context, index) => Container(
                                    height: Get.height,
                                    width: Get.width,
                                    margin: EdgeInsets.all(8),
                                    child: Image.file(
                                      addProductsController.image[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
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
                SizedBox(
                  height: 30.0,
                ),
                TextButton(
                    /* onPressed: () {
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
                    },*/
                    child: Text('Add Product'))
              ],
            ),
          )),
    );
  }
}
