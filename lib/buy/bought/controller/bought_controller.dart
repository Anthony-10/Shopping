import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class BoughtController extends GetxController {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<void> boughtInfo(
      {var price,
      var size,
      var amount,
      var image,
      var name,
      String sellUid}) async {
    var date = DateTime.now().toString();
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      await _fireStore.collection("Bought").doc().set({
        'price': price,
        'size': size,
        'amount': amount,
        'image': image,
        'name': name,
        'userId': uid,
        'sellUid': sellUid,
        'date': date,
      });
      print(
          "---------------------- Uploading User data  ----------------------");
    } on FirebaseException catch (e) {
      print("---------------------- Uploading User data ${e.message}");
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
