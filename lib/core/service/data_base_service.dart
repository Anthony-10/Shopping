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

  var fileURL;

  List fileURLList = [];
  int count;

  Future<void> addUserInfo({String email, String firstName, var url}) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      if (uid != null) {
        await _fireStore.collection("Users").doc(uid).set({
          'email': email,
          'firstName': firstName,
          'Url': url,
          'userId': uid
        });
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

  Future<void> userImage() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    fileURLList.clear();
    print(
        '????????????????????????????????userImage>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    try {
      if (uid != null) {
        if (addProductsController.image.isNotEmpty &&
            addProductsController.drawerImage.isEmpty) {
          addProductsController.image.forEach((file) async {
            final ref = firebase_storage.FirebaseStorage.instance
                .ref()
                .child("ProductImages/${DateTime.now().toString()}");
            final result = await ref.putFile(file);
            fileURL = await result.ref.getDownloadURL();
            fileURLList.add(fileURL);
            print('Image Url$fileURLList');
            print(
                '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<not drawer>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$fileURL');
          });
        } else {
          print('userImage in drawerImage${addProductsController.drawerImage}');
          addProductsController.drawerImage.forEach((file) async {
            final ref = firebase_storage.FirebaseStorage.instance
                .ref()
                .child("UserImage/${DateTime.now().toString()}");
            final result = await ref.putFile(file);
            fileURL = await result.ref.getDownloadURL();
            updateUserInfo(
                email: drawerFunctions.emails,
                firstName: drawerFunctions.names,
                url: fileURL);
            print(
                '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<drawer>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$fileURL');
          });
        }
      } else {
        print("Uid null");
      }
    } on FirebaseException catch (e) {
      print("---------------------- Uploading Image ----------------------");
      Get.snackbar(
        "Uploading Image",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> userProducts({
    String productElement,
    String itemElement,
    String checkBoxElement,
    String colorElement,
    var url,
    var otherProductPrice,
    String otherProductDescription,
    String productName,
    var productSize,
    var productAmount,
  }) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    print(
        '............................................userProducts$fileURLList');
    try {
      if (uid != null) {
        await _fireStore.collection("Products").doc(uid).set({
          'productElement': productElement,
          'itemElement': itemElement,
          'checkBoxElement': checkBoxElement,
          'colorElement': colorElement,
          'Url': url,
          'productSize': productSize,
          'productName': productName,
          'productAmount': productAmount,
          'otherProductPrice': otherProductPrice,
          'otherProductDescription': otherProductDescription,
          'userId': uid,
        });
        addProductsController.image.clear();
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

  Future<void> updateUserInfo({
    var email,
    var firstName,
    var url,
  }) async {
    if (drawerFunctions.emails.isNotEmpty || drawerFunctions.names.isNotEmpty) {
      String uid = FirebaseAuth.instance.currentUser.uid;
      try {
        if (uid != null) {
          await _fireStore.collection("Users").doc(uid).update({
            'email': email,
            'firstName': firstName,
            'userId': uid,
            'Url': url,
          });
          print(
              'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww${drawerFunctions.emails}, ${drawerFunctions.names}');
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
    } else {
      Get.snackbar(
        "Error",
        'Insert data',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
