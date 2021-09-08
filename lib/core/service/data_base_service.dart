import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/widget/drawer/controller/drawer_controller.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class DatabaseService extends GetxController {
  final addProductsController = Get.put(AddProductsController());
  final drawerFunctions = Get.put(DrawerFunctions());

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  final CollectionReference ref =
      FirebaseFirestore.instance.collection('Users');

  final drawerImage = [].obs;

  Future<void> addUserInfo({String email, String firstName}) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      if (uid != null) {
        await _fireStore.collection("Users").doc(uid).set({
          'email': email,
          'firstName': firstName,
          'Url': addProductsController.fileURL,
          'userId': uid,
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
        drawerImage.forEach((file) async {
          final ref = firebase_storage.FirebaseStorage.instance
              .ref()
              .child("images/${DateTime.now().toString()}");
          final result = await ref.putFile(file);
          addProductsController.fileURL = await result.ref.getDownloadURL();
          print(
              'vvvvvvvvvvvv UserImage vvvvvvvvvvv ${addProductsController.fileURL}, vvvvvvvvvvvvvvvvvvvvvvvvv');

          print(
              '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<drawer>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${addProductsController.fileURL}');
        });
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

  Future<void> updateUserInfo() async {
    if (drawerFunctions.emails.isNotEmpty || drawerFunctions.names.isNotEmpty) {
      print(
          '2222222222222 GetData Called 22222222222222222${drawerFunctions.emails}${drawerFunctions.names}');
      print(
          '11111111111 UpdateUserInfo 1111111111111111${addProductsController.fileURL}');
      String uid = FirebaseAuth.instance.currentUser.uid;
      try {
        if (uid != null) {
          await _fireStore.collection("Users").doc(uid).update({
            'email': drawerFunctions.emails,
            'firstName': drawerFunctions.names,
            'userId': uid,
            'Url': addProductsController.fileURL
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
