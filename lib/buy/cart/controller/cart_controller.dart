import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var price;
  var size;
  var description;
  var color;
  var amount;
  var uid;
  var name;
  var sllerId;

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<void> cartInfo({
    var price,
    var size,
    var description,
    var amount,
    var image,
    var name,
  }) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      await _fireStore.collection("Cart").doc().set({
        'price': price,
        'size': size,
        'description': description,
        'amount': amount,
        'image': image,
        'name': name,
        'userId': uid,
      });
    } on FirebaseException catch (e) {
      print(
          "---------------------- Uploading User data  ----------------------");
      Get.snackbar(
        "User data uploaded",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      rethrow;
    }
  }
}
