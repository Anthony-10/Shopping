import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Future<void> userImage() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    print(
        '????????????????????????????????userImage>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    try {
      if (uid != null) {
        if (addProductsController.image.isNotEmpty &&
            addProductsController.drawerImage.isEmpty) {
          addProductsController.image.forEach((file) async {
            final ref = firebase_storage.FirebaseStorage.instance
                .ref()
                .child("images/${DateTime.now().toString()}");
            final result = await ref.putFile(file);
            print('weewewewewewewew $result');
            fileURL = await result.ref.getDownloadURL();
            userProducts();
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
            '???????????????????????????????????????????? UserProducts ?????????????????????????????????????????????/$fileURL');
        addProductsController.image.clear();
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
