import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';

class BuyController extends GetxController {
  var name;
  var id;
  var userUid;
  var image;

  var productElement;
  var itemElement;
  var sellerProduct;

  //User Info
  var url;
  var email;
  var firstName;
  var userId;

  List fileURLList = [];

  //Location
  double lat;
  double long;
  var address;
  var country;

  int likeCount = 0;
  Map likes;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  final customCacheManager = CacheManager(
    Config(
      'customCachKey',
      stalePeriod: Duration(days: 20),
      maxNrOfCacheObjects: 100,
    ),
  );

  Future addFavorite({var image, String name, var userUid}) async {
    String uid = FirebaseAuth.instance.currentUser.uid;

    try {
      if (uid != null) {
        await _fireStore
            .collection("Favorite")
            .doc(userUid)
            .collection("currentUser")
            .doc(uid)
            .set({
          'image': image,
          'name': name,
          'uid': uid,
          'userUid': userUid,
        });
      } else {
        print('Uid null');
      }
    } on FirebaseException catch (e) {
      Get.snackbar(
        "Error Adding User Info",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future handleLikePost() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      if (uid != null) {
        await _fireStore
            .collection("Likes")
            .doc(userUid)
            .collection("currentUser")
            .doc(uid)
            .set({
          'likes': FieldValue.increment(1),
          'image': image,
          'name': name,
          'uid': uid,
          'userUid': userUid
        });
      } else {
        print('Uid null');
      }
    } on FirebaseException catch (e) {
      Get.snackbar(
        "Error Adding User Info",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future removeFavorite({var image, String name, var userUid}) async {
    String uid = FirebaseAuth.instance.currentUser.uid;

    try {
      if (uid != null) {
        await _fireStore
            .collection("Favorite")
            .doc(id)
            .collection("currentUser")
            .doc(uid)
            .delete();
      } else {
        print('Uid null');
      }
    } on FirebaseException catch (e) {
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
