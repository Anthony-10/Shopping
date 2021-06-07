import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddProductsController extends GetxController {
  final picker = ImagePicker();
  //final image = [].obs;
  final image = ''.obs;
  var imageSize = ''.obs;

  getImageGallery(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      image.value = File(pickedFile.path) as String;
      imageSize.value =
          "${(File(imageSize.value).lengthSync() / 1024 / 1024).toStringAsFixed(2)}Mb";
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  getImageCamera(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      image.value = File(pickedFile.path) as String;
      imageSize.value =
          "${(File(imageSize.value).lengthSync() / 1024 / 1024).toStringAsFixed(2)}Mb";
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //String uid = FirebaseAuth.instance.currentUser.uid;

  Future<void> addProducts(String name, var size) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      if (uid != null) {
        await _firestore
            .collection("Products")
            .doc()
            .set({'name': name, 'size': size, 'userId': uid});
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error creating account", e.message,
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      rethrow;
    }
  }
}
