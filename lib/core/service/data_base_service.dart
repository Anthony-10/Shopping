import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DatabaseService extends GetxController {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<void> addUserInfo(String email, String firstName) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      if (uid != null) {
        await _fireStore
            .collection("Users")
            .doc()
            .set({'email': email, 'firstName': firstName, 'userId': uid});
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

  Future<void> userProducts(String email, String firstName) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      if (uid != null) {
        await _fireStore
            .collection("UsersAccount")
            .doc()
            .set({'email': email, 'firstName': firstName, 'userId': uid});
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
