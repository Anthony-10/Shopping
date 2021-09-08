import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';

class BottomSheetChose extends StatelessWidget {
  const BottomSheetChose({
    Key key,
    @required this.addProductsController,
  }) : super(key: key);

  final AddProductsController addProductsController;

  @override
  Widget build(BuildContext context) {
    print(
        '////////////////////// BottomSheetChose ////////////////////////////');
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
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
                addProductsController.getImageGallery(ImageSource.gallery);
                Get.back();
              })
        ],
      ),
    );
  }
}
