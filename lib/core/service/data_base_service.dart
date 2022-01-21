import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
import 'package:shopping_app/core/widget/drawer/controller/drawer_controller.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class DatabaseService extends GetxController {
  final addProductsController = Get.put(AddProductsController());
  final drawerFunctions = Get.put(DrawerFunctions());
  final buyController = Get.put(BuyController());

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  var fileURL;

  List fileURLList = [];
  int count;

  var categories = 0;
  var products = 0;
  var sold = 0;
  var returns = 0;
  var order = 0;

  var itemProducts;

  Future<void> addUserInfo(
      {String email,
      String firstName,
      var url,
      var distances,
      var latitude,
      var longitude}) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      if (uid != null) {
        await _fireStore.collection("Users").doc(uid).set({
          'email': email,
          'firstName': firstName,
          'Url': url,
          'userId': uid,
          'distances': distances,
          'latitude': latitude,
          'longitude': longitude,
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
            addProductsController.image.clear();
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
            addProductsController.drawerImage.clear();
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
        await _fireStore.collection("Products").doc().set({
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
        {
          counterNumber(
              categories: categories,
              products: FieldValue.increment(1),
              sold: sold,
              returns: returns,
              order: order,
              userid: uid);
        }
        {
          if (buyController.itemsCatego.isNotEmpty) {
            if (buyController.itemsCatego.contains(
                addProductsController.productElement.title.toString())) {
              print('No entry,////////////////////');
            } else {
              buyController.categories(
                  items: addProductsController.productElement.title.toString());
              print('pleas enter,>>>>>>>>>>>>>>>>>');
            }
          } else {
            buyController.categories(
                items: addProductsController.productElement.title.toString());
          }
          buyController.itemsCatego.clear();
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

  /*Future<void>userCategories()async {
    if(){

    }
  }*/

  Future<void> getCounterNumber() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore.instance
        .collection("Counter")
        .where('uid', isEqualTo: uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        querySnapshot.docs.forEach((doc) {
          categories = doc['categories'];
          products = doc['products'];
          sold = doc['sold'];
          order = doc['order'];
          returns = doc['returns'];
        });
      } else {
        print(
            'there is no data,llllllllllllllllllllllllllllllllllllllllllllllll');
      }
    });
  }

  Future<void> counterNumber(
      {var categories,
      var products,
      var sold,
      var order,
      var returns,
      var userid}) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore.instance
        .collection("Counter")
        .where('uid', isEqualTo: uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isEmpty) {
        _fireStore.collection("Counter").doc(userid).set({
          'categories': categories,
          'products': products,
          'sold': sold,
          'order': order,
          'returns': returns,
          'uid': userid
        });
        print('set,9999999999999999');
      } else {
        print(
            '$categories,$products,$sold,$order,$returns,$userid,oooooooooooooooooooooooooooooooo');
        _fireStore.collection("Counter").doc(userid).update({
          'categories': categories,
          'products': products,
          'sold': sold,
          'order': order,
          'returns': returns,
          'uid': userid
        });
        print('update,9999999999999999');
      }
    });
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

  void getProducts() {
    print('getProducts,kkkkkkkkkkkkkkkkkkkkkkkkk');

    FirebaseFirestore.instance
        .collection("Products")
        .where("userId", isEqualTo: buyController.id)
        .where('productElement', isEqualTo: buyController.productElement)
        .where('itemElement', isEqualTo: buyController.itemElement)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        querySnapshot.docs.forEach((doc) {
          itemProducts = doc['Url'];
        });
        print('$itemProducts,yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
      } else {
        print("No data");
        return;
      }
    });
  }
}
