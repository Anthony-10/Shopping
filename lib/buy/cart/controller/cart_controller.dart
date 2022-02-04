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

  var afterPrice;
  var sum = 0.obs;
  final value = 0;

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

  sumFunction() {
    print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
    FirebaseFirestore.instance
        .collection('Cart')
        .where('userId', isEqualTo: uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      print('ooooooooooooooooooooooooooooooooooo');
      if (querySnapshot.docs.isNotEmpty) {
        querySnapshot.docs.forEach((doc) {
          print('$sum,888888888888888');
          afterPrice = doc['price'];
          print(
              '$afterPrice,>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
          int pValue = int.parse(afterPrice);
          print('$pValue,llllllllllllllllllllllllll');
          print('$sum,00000000000000000000000000');
          sum += pValue;

          print('$sum,kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
        });
      } else {
        print('wewe');
      }
    });
  }

  void subFunction() {
    print('vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv');
    FirebaseFirestore.instance
        .collection('Cart')
        .where('userId', isEqualTo: uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      print('ooooooooooooooooooooooooooooooooooo');
      if (querySnapshot.docs.isNotEmpty) {
        querySnapshot.docs.forEach((doc) {
          afterPrice = doc['price'];
          print(
              '$afterPrice,>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
          int pValue = int.parse(afterPrice);

          sum -= pValue;

          print('$sum,subSum////////////////////');
        });
      } else {
        sum.value = 0;
        print('$sum,llllllllllllllllllllll');

        print('wewe');
      }
    });
  }
}
