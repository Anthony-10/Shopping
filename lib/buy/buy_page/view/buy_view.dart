import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
import 'package:shopping_app/buy/buy_page/widget/carouselSlider.dart';
import 'package:shopping_app/buy/buy_page/widget/userInfo.dart';
import 'package:shopping_app/buy/data/slide_controller.dart';
import 'package:shopping_app/core/service/data_base_service.dart';
import 'package:shopping_app/core/widget/drawer/controller/drawer_controller.dart';

class BuyView extends StatefulWidget {
  @override
  _BuyViewState createState() => _BuyViewState();
}

class _BuyViewState extends State<BuyView> {
  final buyController = Get.put(BuyController());
  final controller = SlideController();
  final drawerFunctions = Get.put(DrawerFunctions());
  final uid = FirebaseAuth.instance.currentUser;
  final DatabaseService databaseService = Get.put(DatabaseService());

  final usersRef = FirebaseFirestore.instance.collection('location');
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  bool isLiked = false;
  int likeCount = 0;
  var name;

  var height = Get.height;
  var width = Get.width;
  int activeIndex = 0;

  Position _currentUserPosition;
  double distanceImMeter = 0;

  getUsers() {
    usersRef.get().then((QuerySnapshot snapshot) =>
        snapshot.docs.forEach((DocumentSnapshot doc) {
          print(doc.data());
        }));
  }

  Future _getTheDistance() async {
    _currentUserPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print('${_currentUserPosition.latitude}LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');

    print('${buyController.lat}OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO');
    print('wewe');
    distanceImMeter = Geolocator.distanceBetween(_currentUserPosition.latitude,
        _currentUserPosition.longitude, buyController.lat, buyController.long);
    print('rerere');
    var distance = distanceImMeter.round().toInt();
    print('qeqeqe');
    updateDistance(
        address: buyController.address,
        country: buyController.country,
        latitude: buyController.lat,
        longitude: buyController.long,
        distances: distance);
  }

  Future<void> updateDistance(
      {var address,
      var country,
      var latitude,
      var longitude,
      var distances}) async {
    if (distances.isNotEmpty) {
      String uid = FirebaseAuth.instance.currentUser.uid;
      try {
        await _fireStore.collection("Users").doc().update({
          'Address': address,
          'Country': country,
          'latitude': latitude,
          'longitude': longitude,
          'distance': distances,
        });
      } on FirebaseException catch (e) {
        Get.snackbar(
          "Error Adding User ",
          e.message,
          snackPosition: SnackPosition.BOTTOM,
        );
      } catch (e) {
        rethrow;
      }
    }
  }

  Future<void> getData() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection('location').doc().get();
      if (documentSnapshot.exists) {
        setState(() {
          buyController.lat = documentSnapshot.get('latitude');
          buyController.long = documentSnapshot.get('longitude');
          buyController.address = documentSnapshot.get('Address');
          buyController.country = documentSnapshot.get('Country');
        });
      } else {
        print('wewe');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initSttData();*/
    getData();
    _getTheDistance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            CarouselSliderPage(),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SizedBox(
                height: Get.height * 0.06,
                width: Get.width,
                child: TextFormField(
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            UserStaff(),
          ],
        ),
      ),
    );
  }
}
