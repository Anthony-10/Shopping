import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
import 'package:shopping_app/buy/buy_page/view/seller_account.dart';
import 'package:shopping_app/buy/buy_page/widget/carouselSlider.dart';
import 'package:shopping_app/buy/buy_page/widget/userInfo.dart';
import 'package:shopping_app/buy/data/slide_controller.dart';
import 'package:shopping_app/core/service/data_base_service.dart';
import 'package:shopping_app/core/service/local_notification_service.dart';
import 'package:shopping_app/core/widget/drawer/controller/drawer_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class BuyView extends StatefulWidget {
  @override
  _BuyViewState createState() => _BuyViewState();
}

class _BuyViewState extends State<BuyView> {
  final buyController = Get.put(BuyController());
  final controller = SlideController();
  final drawerFunctions = Get.put(DrawerFunctions());
  final uid = FirebaseAuth.instance.currentUser.uid;
  final DatabaseService databaseService = Get.put(DatabaseService());

  final usersRef = FirebaseFirestore.instance.collection('location');
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  var height = Get.height;
  var width = Get.width;
  var emptyText = 'search';

  Position _currentUserPosition;
  double distanceImMeter = 0;
  List userInfo = [];
  List getUserDataList = [];
  final TextEditingController searchBar = TextEditingController();

  QuerySnapshot snapshotData;
  bool isExecuted = false;

  int clickedValue = 0;
  Future _getTheDistance() async {
    _currentUserPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    for (int i = 0; i < userInfo.length; i++) {
      double lat = userInfo[i]['lat'];
      double long = userInfo[i]['long'];
      var url = userInfo[i]['url'];
      var email = userInfo[i]['email'];
      var userId = userInfo[i]['userId'];
      var firstName = userInfo[i]['firstName'];
      distanceImMeter = Geolocator.distanceBetween(
          _currentUserPosition.latitude,
          _currentUserPosition.longitude,
          lat,
          long);
      var distance = distanceImMeter.round().toInt();

      updateDistance(
          email: email,
          firstName: firstName,
          url: url,
          userId: userId,
          distances: distance);
    }
  }

  Future<void> getData() async {
    print('getData888888888888888888888888');

    try {
      FirebaseFirestore.instance
          .collection('Users')
          /*.where('userId', isNotEqualTo: uid)*/
          .where('longitude', isGreaterThan: 0)
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          buyController.lat = doc['latitude'];
          buyController.long = doc['longitude'];
          buyController.url = doc['Url'];
          buyController.email = doc['email'];
          buyController.userId = doc['userId'];
          buyController.firstName = doc['firstName'];
          userInfo.add({
            'lat': buyController.lat,
            'long': buyController.long,
            'url': buyController.url,
            'email': buyController.email,
            'userId': buyController.userId,
            'firstName': buyController.firstName
          });
        });
      }).whenComplete(() => _getTheDistance());
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateDistance({
    var email,
    var firstName,
    var url,
    var userId,
    var distances,
  }) async {
    if (distances != null) {
      try {
        await _fireStore.collection("Users").doc(userId).update({
          'email': email,
          'firstName': firstName,
          'Url': url,
          'userId': userId,
          'distances': distances
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
    await FirebaseFirestore.instance
        .collection('Users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        buyController.url = doc['Url'];
        buyController.email = doc['email'];
        buyController.userId = doc['userId'];
        buyController.firstName = doc['firstName'];
        getUserDataList.add({
          'Urls': buyController.url,
          'email': buyController.email,
          'userId': buyController.userId,
          'firstName': buyController.firstName
        });
      });
    });
    print('$getUserDataList,9999999999999999999999999999999');
  }

  @override
  void initState() {
    // TODO: implement initSttData();*/
    getData();
    super.initState();

    ///gives you the message on which user taps
    ///and it opens the app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      print('opens the app>>>>>>>>>>>>>>>>>>>>>>>>>>');
      if (message != null) {
        final routeFromMessage = message.data['/sell_view'];
        Get.to(routeFromMessage);
      }
    });

    ///foreground work
    FirebaseMessaging.onMessage.listen((message) {
      print('onMessage>>>>>>>>>>>>>>>>>>>>>>>>>>');
      if (message.notification != null) {
        print(message.notification.body);
        print(message.notification.title);
      }
      LocalNotificationService.display(message);
    });

    ///when the app is in background but opened and user taps
    ///on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data['/sell_view'];
      Get.to(routeFromMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget searchData() {
      return isExecuted
          ? Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 1.8,
                    mainAxisSpacing: 9,
                    crossAxisSpacing: 5,
                    crossAxisCount: 2,
                  ),
                  primary: false,
                  padding: const EdgeInsets.all(15),
                  physics: BouncingScrollPhysics(),
                  itemCount: snapshotData.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: Get.height * 0.9,
                      width: Get.width * 0.5,
                      child: Column(
                        children: [
                          Container(
                            height: Get.height * 0.30,
                            width: Get.width * 0.5,
                            child: GestureDetector(
                              onTap: () {
                                buyController.name =
                                    snapshotData.docs[index]['firstName'];
                                buyController.id =
                                    snapshotData.docs[index]['userId'];
                                buyController.image =
                                    snapshotData.docs[index]['Url'];
                                Get.to(() => SellerAccount());
                              },
                              child: Card(
                                child: CachedNetworkImage(
                                  cacheManager:
                                      buyController.customCacheManager,
                                  imageUrl: snapshotData.docs[index]['Url']
                                      .toString(),
                                  fit: BoxFit.fill,
                                  //maxHeightDiskCache: 75,
                                  placeholder: (context, url) => Container(
                                    color: Colors.black12,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    color: Colors.black12,
                                    child: Icon(Icons.error, color: Colors.red),
                                  ),
                                ),
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                elevation: 20.0,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * .02,
                          ),
                          Container(
                            width: Get.width * 0.3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshotData.docs[index]['firstName']
                                      .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                                Text(
                                  '${snapshotData.docs[index]['distances']} KM'
                                      .toString(),
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )
          : Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 1.8,
                  mainAxisSpacing: 9,
                  crossAxisSpacing: 5,
                  crossAxisCount: 2,
                ),
                primary: false,
                padding: const EdgeInsets.all(15),
                physics: BouncingScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[500],
                    highlightColor: Colors.grey[100],
                    child: Container(
                      height: Get.height * 0.9,
                      width: Get.width * 0.5,
                      child: Column(
                        children: [
                          Container(
                            height: Get.height * 0.30,
                            width: Get.width * 0.5,
                            child: Card(
                              color: Colors.grey,
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              elevation: 20.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * .02,
                          ),
                          Container(
                            width: Get.width * 0.3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: Get.height * .03,
                                  width: Get.width * .3,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                                Container(
                                  height: Get.height * .03,
                                  width: Get.width * .3,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
    }

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
                  key: const ValueKey("searchBar"),
                  decoration: InputDecoration(
                      hintText: "search",
                      suffixIcon: GetBuilder<BuyController>(
                          init: BuyController(),
                          builder: (val) {
                            return IconButton(
                                icon: clickedValue == 0
                                    ? Icon(Icons.search)
                                    : Icon(Icons.cancel),
                                onPressed: () {
                                  setState(() {
                                    clickedValue == 0
                                        ? clickedValue = 1
                                        : clickedValue = 0;
                                  });
                                  val.queryData(searchBar.text).then((value) {
                                    snapshotData = value;
                                    setState(() {
                                      isExecuted = true;
                                    });
                                  });
                                });
                          }),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  keyboardType: TextInputType.text,
                  controller: searchBar,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            clickedValue == 0 ? UserStaff() : searchData(),
          ],
        ),
      ),
    );
  }
}
