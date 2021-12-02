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

  bool isLiked = false;
  int likeCount = 0;
  var name;

  var height = Get.height;
  var width = Get.width;
  int activeIndex = 0;

  Position _currentUserPosition;
  double distanceImMeter = 0.0;

  Future _getTheDistance() async {
    _currentUserPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print('${_currentUserPosition.latitude}LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
    double storelat = -1.2871771;
    double storelog = 36.8201451;

    distanceImMeter = await Geolocator.distanceBetween(
        _currentUserPosition.latitude,
        _currentUserPosition.longitude,
        storelat,
        storelog);
  }

  Future<void> getData() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('location')
          .doc(uid)
          .get();
      if (documentSnapshot.exists) {
        setState(() {
          drawerFunctions.names = documentSnapshot.get('firstName');
          drawerFunctions.emails = documentSnapshot.get('email');
          drawerFunctions.url = documentSnapshot.get('userId');
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
