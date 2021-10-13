import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_app/core/service/data_base_service.dart';
import 'package:shopping_app/sell/models/item_model.dart';
import 'package:shopping_app/sell/models/product_model.dart';

class AddProductsController extends GetxController {
  final picker = ImagePicker();
  final image = [].obs;
  final drawerImage = [].obs;
  var imageSize = ''.obs;
  int initialIndex = 0;
  int bottomIndex = 0;

  firebase_storage.Reference ref;
  CollectionReference imgRef;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStoraqe = FirebaseStorage.instance;

  ProductItems productElement;
  ItemModel itemElement;
  var checkBoxElement;
  bool checkBoxValue = false;

  var colorElement;
  bool colorValue = false;

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
        });
      } else {
        print('At the drawerImage');
        drawerImage.clear();
        pickedFile.files.forEach((selectedFile) {
          final File file = File(selectedFile.path);
          drawerImage.add(file);
          print('At the drawerImage$drawerImage');
        });
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
