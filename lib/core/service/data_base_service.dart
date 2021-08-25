import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';

class DatabaseService extends GetxController {
  final addProductsController = Get.put(AddProductsController());

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  final CollectionReference ref =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserInfo({String email, String firstName}) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      if (uid != null) {
        await _fireStore.collection("Users").doc().set({
          'email': email,
          'firstName': firstName,
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

  Future<void> updateUserInfo({String email, String firstName}) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      if (uid != null) {
        await _fireStore.collection("Users").doc().update({
          'email': email,
          'firstName': firstName,
          'userId': uid,
          'Url': addProductsController.fileURL
        });
        print('wwwwwwwwwwwww$email$firstName');
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
}
