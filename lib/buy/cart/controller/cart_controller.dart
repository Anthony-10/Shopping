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
  final math = [].obs;

  var values = 0;
  var afterAmount;
  var sumAmountPrice;

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
      Get.snackbar(
        "User data uploaded",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sumFunction() async {
    print('sumFunctionaaaaaaaaaaaaaaaaaaaaaa');
    try {
      await _fireStore
          .collection('Cart')
          .where('userId', isEqualTo: uid)
          .get()
          .then((QuerySnapshot querySnapshot) {
        math.clear();
        sum.value = 0;
        values = 0;
        if (querySnapshot.docs.isNotEmpty) {
          querySnapshot.docs.forEach((doc) {
            afterPrice = doc['price'].toString();
            afterAmount = doc['amount'].toString();
            int pValue = int.parse(afterPrice);
            int aValue = int.parse(afterAmount);
            sumAmountPrice = aValue * pValue;
            math.add(sumAmountPrice);
          });
          math.forEach((e) => values += e);
          sum += values;
        } else {
          print('wewe');
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

  Future<void> subFunction() async {
    print('subFunction');
    try {
      await _fireStore
          .collection('Cart')
          .where('userId', isEqualTo: uid)
          .get()
          .then((QuerySnapshot querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          querySnapshot.docs.forEach((doc) {
            //afterPrice = doc['price'];
            /*print(
              '$afterPrice,>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');*/
            //int pValue = int.parse(afterPrice);
            //print('$pValue,+++++++++++++++++++++++++');
            //print('$sum,==============================');
            //math.clear();
            //math.remove(afterPrice);

            //int pValue = int.parse(sumAmountPrice);
          });
          sum = sum - sumAmountPrice;

          print('$sum,subSum////////////////////');
        } else {
          sum.value = 0;
          print('$sum,llllllllllllllllllllll');

          print('wewe');
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

  Future<void> deleteCartInfo() async {
    try {
      var collection = FirebaseFirestore.instance.collection("Cart");
      var snapshot = await collection.get();
      for (var doc in snapshot.docs) {
        await doc.reference.delete();
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
