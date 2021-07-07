import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProductsController extends GetxController {
  final picker = ImagePicker();
  final image = [].obs;
  //File image;
  // File image = ''.obs as File;
  var imageSize = ''.obs;

  getImageGallery(ImageSource imageSource) async {
    image.clear();
    final FilePickerResult pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );
    if (pickedFile != null) {
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
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  getImageCamera(ImageSource imageSource) async {
    //image.clear();

    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
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
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //String uid = FirebaseAuth.instance.currentUser.uid;

/*  Future<void> addProducts(String name, var size) async {
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
  }*/
}
