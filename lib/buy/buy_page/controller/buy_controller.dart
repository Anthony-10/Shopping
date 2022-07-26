import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';

class BuyController extends GetxController {
  var name;
  var id;
  var userUid;
  var image;
  List images = [];
  var item = ''.obs;

  var productElement;
  var itemElement;
  var sellerProduct;

  //User Info
  var url;
  var email;
  var firstName;
  var userId;
  var distance;

  var color = 0.obs;

  //Location
  double lat;
  double long;
  var locationId;
  var address;
  var country;
  var postalCode;

  int counter = 1;

  var countLikes = 0;
  var countDisLikes = 0;
  var likes = 0.obs;
  var addLike = 1;

  var items = "".obs;
  List itemsCatego = [].obs;

  var token;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  //final addProductsController = Get.put(AddProductsController());

  final customCacheManager = CacheManager(
    Config(
      'customCachKey',
      stalePeriod: Duration(days: 20),
      maxNrOfCacheObjects: 100,
    ),
  );

  void firstCategories() {
    if (itemsCatego.isNotEmpty) {
      item.value = itemsCatego[0];
    } else {
      return;
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

  Future<void> categories({var items}) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      await _fireStore.collection("Categories").doc().set({
        'Item': items,
        'userId': uid,
      });
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

  Future getCategories({var uid}) async {
    itemsCatego.clear();
    try {
      await FirebaseFirestore.instance
          .collection("Categories")
          .where('userId', isEqualTo: uid)
          .get()
          .then((QuerySnapshot querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          querySnapshot.docs.forEach((doc) {
            items.value = doc['Item'];
            itemsCatego.add(items.value);
          });
        } else {
          print("No data");
          return;
        }
      });
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

  Future<void> checkForLikes() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      FirebaseFirestore.instance
          .collection("Favorite")
          .doc(uid)
          .collection("currentUser")
          .doc(id)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          removeFavorite(image: image, name: name, userUid: id);

          color.value = 0;

          print('removeFavorite, ############################################');
        } else {
          addFavorite(image: image, name: name, userUid: id);

          color.value = 1;

          print('addFavorite, *******************************************');
        }
      });
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

  Future addFavorite({var image, String name, var userUid}) async {
    String uid = FirebaseAuth.instance.currentUser.uid;

    try {
      if (uid != null) {
        await _fireStore
            .collection("Favorite")
            .doc(uid)
            .collection("currentUser")
            .doc(userUid)
            .set({
          'image': image,
          'name': name,
          'uid': uid,
          'userUid': userUid,
        });
        {
          FirebaseFirestore.instance
              .collection("likeCounts")
              .where('id', isEqualTo: id)
              .get()
              .then((QuerySnapshot querySnapshot) async {
            if (querySnapshot.docs.isEmpty) {
              likeCounts(countLikes: addLike, likeUid: id);
            } else {
              likeCounts(countLikes: FieldValue.increment(1), likeUid: id);
            }
          });
        }
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
            .doc(uid)
            .collection("currentUser")
            .doc(userUid)
            .delete();
        {
          dislikeCount(countDisLikes: FieldValue.increment(-1), disLikeUid: id);
        }
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

  Future<void> likeCounts({var countLikes, var likeUid}) async {
    print('likeCounts function');
    try {
      FirebaseFirestore.instance
          .collection("likeCounts")
          .where('id', isEqualTo: likeUid)
          .get()
          .then((QuerySnapshot querySnapshot) async {
        if (querySnapshot.docs.isEmpty) {
          await _fireStore.collection("likeCounts").doc(likeUid).set({
            'likes': countLikes,
            'id': likeUid,
          });
        } else {
          await _fireStore.collection("likeCounts").doc(likeUid).update({
            'likes': countLikes,
            'id': likeUid,
          });
        }
        {
          getLikeCount(ids: id);
        }
      });
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

  void dislikeCount({var countDisLikes, var disLikeUid}) async {
    try {
      await _fireStore.collection("likeCounts").doc(disLikeUid).update({
        'likes': countDisLikes,
        'id': disLikeUid,
      });
      {
        getLikeCount(ids: id);
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

  Future<void> getLikeCount({var ids}) async {
    try {
      FirebaseFirestore.instance
          .collection("likeCounts")
          .where('id', isEqualTo: ids)
          .get()
          .then((QuerySnapshot querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          querySnapshot.docs.forEach((doc) {
            likes.value = doc['likes'];
          });
        } else {
          print(
              'there is no data,llllllllllllllllllllllllllllllllllllllllllllllll');
        }
      });
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

  void colorFunction() {
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      FirebaseFirestore.instance
          .collection("Favorite")
          .doc(uid)
          .collection("currentUser")
          .doc(id)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          color.value = 1;
        } else {
          color.value = 0;
        }
      });
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

  Future queryData(String queryString) async {
    try {
      return FirebaseFirestore.instance
          .collection('Users')
          .where('firstName', isEqualTo: queryString)
          .get();
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

  Future<void> getUserToken() async {
    print('getUserToken,>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    final uuid = FirebaseAuth.instance.currentUser.uid;
    try {
      FirebaseFirestore.instance
          .collection("NotificationToken")
          .where('id', isEqualTo: uuid)
          .get()
          .then((QuerySnapshot querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          querySnapshot.docs.forEach((doc) {
            token = doc['token'];
          });
        } else {
          print('<<<<<<<<<<No data>>>>>>>>>>>');
        }
      });
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
