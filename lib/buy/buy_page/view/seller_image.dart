import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
import 'package:shopping_app/buy/data/slide_controller.dart';
import 'package:shopping_app/core/service/data_base_service.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SellerImage extends StatefulWidget {
  //const SellerImage({Key key}) : super(key: key);
  @override
  State<SellerImage> createState() => _SellerImageState();
}

class _SellerImageState extends State<SellerImage> {
  final buyController = Get.put(BuyController());
  final controller = SlideController();
  final databaseService = Get.put(DatabaseService());

  var heights = Get.height;

  var widths = Get.width;

  var activeIndex = 0;

  var ware;
  var wre;

  @override
  Widget build(BuildContext context) {
    print('SellerImage,kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
    return Container(
      height: heights * .5,
      width: widths * .8,
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Products")
              .where('Url', isEqualTo: buyController.image)
              .where("userId", isEqualTo: buyController.id)
              .where('productElement', isEqualTo: buyController.productElement)
              .where('itemElement', isEqualTo: wre = buyController.itemElement)
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
                  print(
                      '${buyController.id},${buyController.productElement},${buyController.itemElement},${buyController.image},lllllllllllllllllllllllllllllll');
                  var wewe = snapshot.data.docs.toString();
                  print('$wewe,wwwwwwwwwwwwwwwwwwwwwwwwwww');
                  return Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                            physics: BouncingScrollPhysics(),
                            //controller: controller.controller,
                            /*onPageChanged: controller.selectedPageIndex,*/
                            itemCount: snapshot.data.size,
                            itemBuilder: (context, index) {
                              print('uuuuuuuuuuuuuuuuuuuuuu');
                              return Container(
                                margin: const EdgeInsets.all(16),
                                height: heights * .5,
                                width: widths * .5,
                                //TODO
                                child: Card(
                                  child: CachedNetworkImage(
                                    cacheManager:
                                        buyController.customCacheManager,
                                    imageUrl: snapshot.data.docs[index]['Url'],
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) => Container(
                                      color: Colors.black12,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                      color: Colors.black12,
                                      child:
                                          Icon(Icons.error, color: Colors.red),
                                    ),
                                  ),
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  elevation: 20.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              );
                            }),
                      ),
                      SmoothPageIndicator(
                        controller: controller.controller,
                        //activeIndex: ,
                        count: snapshot.data.docs.length,
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
              print('$ware,mmmmmmmmmmmmmmpppppppppppppppppppppppppppp');
              return null;
            } else {
              return Center(child: Text('Loading.....'));
            }
          }),
    );
  }
}
