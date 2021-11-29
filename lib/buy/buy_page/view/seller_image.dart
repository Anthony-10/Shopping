import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
import 'package:shopping_app/buy/data/slide_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SellerImage extends StatefulWidget {
  //const SellerImage({Key key}) : super(key: key);
  @override
  State<SellerImage> createState() => _SellerImageState();
}

class _SellerImageState extends State<SellerImage> {
  final buyController = Get.put(BuyController());
  final controller = SlideController();

  var heights = Get.height;

  var widths = Get.width;

  var activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heights * .5,
      width: widths * .8,
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Products")
              .where("userId", isEqualTo: buyController.id)
              .where('productElement', isEqualTo: buyController.productElement)
              .where('itemElement', isEqualTo: buyController.itemElement)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (!snapshot.hasData) {
                return const Center(
                  child: Text("Check your connection"),
                );
              } else {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                            physics: BouncingScrollPhysics(),
                            controller: controller.controller,
                            //onPageChanged: controller.selectedPageIndex,
                            itemCount: snapshot.data.size,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(16),
                                //TODO
                                child: Image.network(
                                  snapshot.data.docs[index]['Url'][0]
                                      .toString()
                                      .characters
                                      .iterator
                                      .current,
                                  height: heights * .5,
                                  width: widths * .5,
                                ),
                              );
                            }),
                      ),
                      SmoothPageIndicator(
                        controller: controller.controller,
                        //activeIndex: ,
                        count: snapshot.data.size,
                        effect: JumpingDotEffect(
                          activeDotColor: Colors.red,
                          dotColor: Colors.white,
                          dotHeight: 10,
                          dotWidth: 10,
                          spacing: 16,
                          verticalOffset: 10,
                        ),
                      )
                    ],
                  );
                }
              }
              return null;
            } else {
              return Center(child: Text('Loading.....'));
            }
          }),
    );
  }
}
