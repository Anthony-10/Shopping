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
  List loglatid = [];

  Future _getTheDistance() async {
    _currentUserPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    /* print('${_currentUserPosition.latitude}Lalalalalalalalalalalala');
    print('${buyController.lat}latlatlatlatlatlatlatlatlat');
    print('${_currentUserPosition.longitude}lololololololololololololo');
    print('${buyController.long}longlonglonglonglonglonglonglonglonglong');*/
    print('${loglatid.length},kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
    for (int i = 0; i < loglatid.length; i++) {
      double lat = loglatid[i]['lat'];
      double long = loglatid[i]['long'];
      print('$lat,ppppppppppppppppppp');
      print('${loglatid[i]['long']},77777777777777777777777777');
      print('$long,oooooooooooooooooooooo');
      distanceImMeter = Geolocator.distanceBetween(
          _currentUserPosition.latitude,
          _currentUserPosition.longitude,
          lat,
          long);
      print('rerere');
      var distance = distanceImMeter.round().toInt();
      print('qeqeqe');
      print('$distance,llllllllllllllllllllllllllllllllllllllllllllll');
      /*updateDistance(
          url: buyController.url,
          email: buyController.email,
          firstName: buyController.firstName,
          distances: distance);*/
    }
  }

  Future<void> getData() async {
    print('getData888888888888888888888888');
    try {
      FirebaseFirestore.instance
          .collection('location')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          buyController.lat = doc['latitude'];
          buyController.long = doc['longitude'];
          buyController.locationId = doc['uid'];
          loglatid.add({
            'lat': buyController.lat,
            'long': buyController.long,
            'locationId': buyController.locationId
          });
          //loglatid.add({'long': buyController.long});
          //loglatid.add(buyController.locationId);
          print('${doc['latitude']},eeeeeeeeeeeeeeeeeeeeee');
          print('${doc['longitude']},eeeeeeeeeeeeeeeeeeeeee');
          print('$loglatid,999999999999999999999999999999999999999999999999');
        });
      }).whenComplete(() => _getTheDistance());

      /*DocumentSnapshot documentSnapshot =
          await*/
      /* FirebaseFirestore.instance
          .collection('Products')
          .doc()
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          setState(() {
            buyController.lat = documentSnapshot.get('latitude');
            buyController.long = documentSnapshot.get('longitude');
            buyController.address = documentSnapshot.get('Address');
            buyController.country = documentSnapshot.get('Country');
          });
          print('${buyController.lat} getData:::::::::::::::::::::::::');
        } else {
          print('wewe');
        }
      });*/
      /* print('$documentSnapshot,55555555555555555555555555555555555555555');
      if (documentSnapshot.exists) {
        setState(() {
          buyController.lat = documentSnapshot.get('latitude');
          buyController.long = documentSnapshot.get('longitude');
          buyController.address = documentSnapshot.get('Address');
          buyController.country = documentSnapshot.get('Country');
        });
        print('${buyController.lat} getData:::::::::::::::::::::::::');
      } else {
        print('wewe');
      }*/
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateDistance(
      {var url, var email, var firstName, var distances}) async {
    print('$distances,ggggggggggggggggggggggggjgjjgjgjgj');
    if (distances != null) {
      try {
        await _fireStore.collection("Users").doc().update({
          'Url': buyController.url,
          'email': buyController.email,
          'firstName': buyController.firstName,
          'distances': distances,
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

  Future<void> getUserData() async {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('Users').doc().get();
    if (documentSnapshot.exists) {
      setState(() {
        buyController.url = documentSnapshot.get('Url');
        buyController.email = documentSnapshot.get('email');
        buyController.firstName = documentSnapshot.get('firstName');
        buyController.userId = documentSnapshot.get('userId');
      });
      print('${buyController.lat} getUserData:::::::::::::::::::::::::');
    } else {
      print('wewe');
    }
  }

  @override
  void initState() {
    // TODO: implement initSttData();*/
    getData();
    /*_getTheDistance();*/
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
