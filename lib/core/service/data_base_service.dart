import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/widget/drawer/controller/drawer_controller.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class DatabaseService extends GetxController {
  final addProductsController = Get.put(AddProductsController());
  final drawerFunctions = Get.put(DrawerFunctions());

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  var defaulImage =
      "https://firebasestorage.googleapis.com/v0/b/shopping-643cc.appspot.com/o/images%2F2021-09-10%2012%3A55%3A08.346550?alt=media&token=afa6d29a-45de-462f-bc37-523604e86342";

  var fileURL;

  List fileURLList = [];

  List<UploadTask> uploadedTasks = [];

  List<File> selectedFiles = [];

  Future<void> addUserInfo({String email, String firstName}) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      if (uid != null) {
        await _fireStore.collection("Users").doc(uid).set({
          'email': email,
          'firstName': firstName,
          'Url': defaulImage,
          'userId': uid
        });
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

  uploadFileToStorage(File file) {
    UploadTask task = firebase_storage.FirebaseStorage.instance
        .ref()
        .child("images/${DateTime.now().toString()}")
        .putFile(file);
    return task;
  }

  saveImageUrlToFirebase(UploadTask task) {
    task.snapshotEvents.listen((snapShot) {
      if (snapShot.state == TaskState.success) {
        snapShot.ref.getDownloadURL().then((imageUrl) => userProducts(
            productElement:
                addProductsController.productElement.title.toString(),
            itemElement: addProductsController.itemElement.title.toString(),
            checkBoxElement: addProductsController.checkBoxElement.toString(),
            colorElement: addProductsController.colorElement.toString(),
            url: imageUrl));
      }
    });
  }

  Future<void> userImage() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    fileURLList.clear();
    print(
        '????????????????????????????????userImage>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    try {
      if (uid != null) {
        print('"""""""""""""""""""""""""""""""""""""""""""""""""at userImage');
        if (addProductsController.image.isNotEmpty &&
            addProductsController.drawerImage.isEmpty) {
          print('______________________________________________at userImage');
          addProductsController.image.forEach((file) async {
            print(
                'vvvvvvvvvvvvvvvvvvvvvvvv${addProductsController.image} userImage');
            final ref = firebase_storage.FirebaseStorage.instance
                .ref()
                .child("images/${DateTime.now().toString()}");
            print(
                '<<<<<<<<<<<<<<<<<<<<<<<<<<<$ref>>>>>>>>>>>>>>>>>>>>>>>>>>>> userImage');
            final result = await ref.putFile(file);
            print(
                'mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm$result userImage');
            fileURL = await result.ref.getDownloadURL();
            print(
                'ttttttttttttttttttttttttttttttttttttttttttttt$fileURL userImage');
            fileURLList.add(fileURL);
            print('Image Url$fileURLList');
            print(
                '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<not drawer>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$fileURL');
          });
        } else {
          print('userImage in drawerImage${addProductsController.drawerImage}');
          addProductsController.drawerImage.forEach((file) async {
            final ref = firebase_storage.FirebaseStorage.instance
                .ref()
                .child("images/${DateTime.now().toString()}");
            final result = await ref.putFile(file);
            fileURL = await result.ref.getDownloadURL();
            updateUserInfo(
                email: drawerFunctions.emails,
                firstName: drawerFunctions.names,
                Url: fileURL);
            print(
                'vvvvvvvvvvvv UserImage vvvvvvvvvvv $fileURL, vvvvvvvvvvvvvvvvvvvvvvvvv');

            print(
                '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<drawer>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$fileURL');
          });
        }
      } else {
        print("Uid null");
      }
    } on FirebaseAuthException catch (e) {
      print("---------------------- Uploading Image ----------------------");
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
    var url,
  }) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    print(
        '............................................userProducts$fileURLList');
    try {
      if (uid != null) {
        await _fireStore.collection("Products").doc().set({
          'productElement': productElement,
          'itemElement': itemElement,
          'checkBoxElement': checkBoxElement,
          'colorElement': colorElement,
          'Url': url,
          'userId': uid
        });
        addProductsController.image.clear();
      } else {
        print('Uid null');
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

  Future<void> updateUserInfo({
    var email,
    var firstName,
    var Url,
  }) async {
    if (drawerFunctions.emails.isNotEmpty || drawerFunctions.names.isNotEmpty) {
      print(
          '2222222222222 GetData Called 22222222222222222${drawerFunctions.emails}${drawerFunctions.names}');
      print('11111111111 UpdateUserInfo 1111111111111111$fileURL');
      String uid = FirebaseAuth.instance.currentUser.uid;
      try {
        if (uid != null) {
          await _fireStore.collection("Users").doc(uid).update({
            'email': email,
            'firstName': firstName,
            'userId': uid,
            'Url': Url,
          });
          print(
              'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww${drawerFunctions.emails}, ${drawerFunctions.names}');
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
    } else {
      Get.snackbar(
        "Error",
        'Insert data',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
