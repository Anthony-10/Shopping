import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_app/sell/models/item_model.dart';
import 'package:shopping_app/sell/models/product_model.dart';

class AddProductsController extends GetxController {
  final image = [].obs;
  final drawerImage = [].obs;
  int initialIndex = 0;
  int bottomIndex = 0;

  ProductItems productElement;
  ItemModel itemElement;
  var checkBoxElement;
  bool checkBoxValue = false;

  var colorElement;
  bool colorValue = false;

  final formKey = GlobalKey<FormState>();

  final TextEditingController productName = TextEditingController();
  final TextEditingController productSize = TextEditingController();
  final TextEditingController productAmount = TextEditingController();
  final TextEditingController otherProductPrice = TextEditingController();
  final TextEditingController otherProductDescription = TextEditingController();

  getImageGallery(ImageSource imageSource) async {
    image.clear();
    final FilePickerResult pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (pickedFile != null) {
      if (bottomIndex == 0) {
        if (pickedFile.count > 3) {
          Get.snackbar('Error', 'More than 3 items selected',
              snackPosition: SnackPosition.BOTTOM);
          return;
        } else if (pickedFile.count < 3) {
          Get.snackbar('Error', 'Less than 3 items selected',
              snackPosition: SnackPosition.BOTTOM);
          return;
        }
        pickedFile.files.forEach((selectedFile) {
          final File file = File(selectedFile.path);
          image.add(file);
          print('At the drawerImage$image');
        });
      } else {
        print('At the drawerImage');
        drawerImage.clear();
        if (pickedFile.count > 1) {
          Get.snackbar('Error', 'More than 1 items selected',
              snackPosition: SnackPosition.BOTTOM);
        } else {
          pickedFile.files.forEach((selectedFile) {
            final File file = File(selectedFile.path);
            drawerImage.add(file);
            print('At the drawerImage$drawerImage');
          });
        }
      }
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM);
      print('Error' 'No image selected');
    }
  }

  getImageCamera(ImageSource imageSource) async {
    //image.clear();

    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      if (bottomIndex == 0) {
        image.add(File(pickedFile.path));
        if (image.length == 3) {
          return;
        } else if (image.length > 3) {
          image.removeLast();
          Get.snackbar('Error', 'More than 3 items selected',
              snackPosition: SnackPosition.BOTTOM);
        } else {
          this.getImageCamera(imageSource);
        }
      } else {
        Get.snackbar('Error', 'No image selected',
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      drawerImage.add(File(pickedFile.path));
    }
  }
}
