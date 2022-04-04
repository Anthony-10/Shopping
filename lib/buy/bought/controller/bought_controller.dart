import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
import 'package:shopping_app/core/service/data_base_service.dart';

class BoughtController extends GetxController {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final DatabaseService databaseService = Get.put(DatabaseService());
  final buyController = Get.put(BuyController());

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

      {
        databaseService.counterNumber(
            categories: databaseService.categories,
            products: databaseService.products,
            sold: databaseService.sold,
            returns: databaseService.returns,
            order: FieldValue.increment(1),
            likes: databaseService.likes,
            uuid: buyController.id);
      }
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
