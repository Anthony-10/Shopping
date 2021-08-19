import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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

  String fileURL;

  getImageGallery(ImageSource imageSource) async {
    image.clear();
    final FilePickerResult pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.any,
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
        pickedFile.files.forEach((selectedFile) {
          final File file = File(selectedFile.path);
          drawerImage.add(file);
        });
      }
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM);
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

  Future<void> userImage() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    print(
        '????????????????????????????????userImage>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    try {
      if (uid != null) {
        if (image.isNotEmpty && drawerImage.isEmpty) {
          image.forEach((file) async {
            final ref = firebase_storage.FirebaseStorage.instance
                .ref()
                .child("images/${DateTime.now().toString()}");
            final result = await ref.putFile(file);
            fileURL = await result.ref.getDownloadURL();

            print(
                '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$fileURL');
          });
        } else {
          drawerImage.forEach((file) async {
            final ref = firebase_storage.FirebaseStorage.instance
                .ref()
                .child("images/${DateTime.now().toString()}");
            final result = await ref.putFile(file);
            fileURL = await result.ref.getDownloadURL();

            print(
                '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$fileURL');
          });
        }
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Uploading Image",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> userProducts({
    String productElement,
    String itemElement,
    String checkBoxElement,
    String colorElement,
  }) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      if (uid != null) {
        await _fireStore.collection("Products").doc().set({
          'productElement': productElement,
          'itemElement': itemElement,
          'checkBoxElement': checkBoxElement,
          'colorElement': colorElement,
          'Url': fileURL,
          'userId': uid
        });
        print(
            '?????????????????????????????????????????????????????????????????????????????????????????/$fileURL');
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error Adding User Info",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      rethrow;
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
