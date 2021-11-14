import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
import 'package:shopping_app/buy/buy_page/view/seller_account.dart';
import 'package:shopping_app/buy/data/slide_controller.dart';
import 'package:shopping_app/core/service/data_base_service.dart';
import 'package:shopping_app/core/widget/drawer/controller/drawer_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: Get.height * 0.3,
                  width: Get.width,
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index),
                        viewportFraction: 1,
                        height: height * 0.6,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayAnimationDuration: Duration(seconds: 2),
                        autoPlayInterval: Duration(seconds: 5),
                        aspectRatio: 18 / 8),
                    itemCount: controller.homePageData.length,
                    itemBuilder: (context, index, realIndex) {
                      final image = controller.homePageData[index].imageAsset;
                      return Container(
                        height: height * 0.6,
                        width: width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(image),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        margin: const EdgeInsets.all(15),
                      );
                    },
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 150,
                    child: AnimatedSmoothIndicator(
                      activeIndex: activeIndex,
                      count: controller.homePageData.length,
                      effect: JumpingDotEffect(
                        activeDotColor: Colors.red,
                        dotColor: Colors.white,
                        dotHeight: 10,
                        dotWidth: 10,
                        spacing: 16,
                        verticalOffset: 10,
                      ),
                    )),
              ],
            ),
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
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Users")
                    .where("userId",
                        isNotEqualTo: FirebaseAuth.instance.currentUser.uid)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: Text("Check your connection"),
                      );
                    } else {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1 / 1.7,
                              mainAxisSpacing: 9,
                              crossAxisSpacing: 5,
                              crossAxisCount: 2,
                            ),
                            primary: false,
                            padding: const EdgeInsets.all(15),
                            physics: BouncingScrollPhysics(),
                            itemCount: snapshot.data.size,
                            itemBuilder: (context, index) {
                              return Container(
                                height: height * 0.9,
                                width: width * 0.5,
                                child: Column(
                                  children: [
                                    Container(
                                      height: Get.height * 0.30,
                                      width: Get.width * 0.4,
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(() => SellerAccount());
                                          buyController.name = snapshot
                                              .data.docs[index]['firstName'];
                                          buyController.id = snapshot
                                              .data.docs[index]['userId'];
                                        },
                                        child: Card(
                                          child: Image.network(
                                            snapshot.data.docs[index]['Url']
                                                .toString(),
                                            fit: BoxFit.fill,
                                          ),
                                          semanticContainer: true,
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          elevation: 20.0,
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot
                                                .data.docs[index]['firstName']
                                                .toString(),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('30'),
                                                Icon(Icons.favorite),
                                              ])
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }
                    }
                    return null;
                  } else {
                    return Center(child: Text('Loading.....'));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
