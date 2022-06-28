import 'package:cached_network_image/cached_network_image.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container(
        height: heights * .5,
        width: widths * .8,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: controller.controller,
                  //onPageChanged: controller.selectedPageIndex,
                  itemCount: buyController.image.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(16),
                      height: heights * .5,
                      width: widths * .5,
                      //TODO
                      child: Card(
                        child: CachedNetworkImage(
                          cacheManager: buyController.customCacheManager,
                          imageUrl: buyController.image[index].toString(),
                          fit: BoxFit.fill,
                          placeholder: (context, url) => Container(
                            color: Colors.black12,
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: Colors.black12,
                            child: Icon(Icons.error, color: Colors.red),
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
              count: buyController.image.length,
              controller: controller.controller,
              //activeIndex: ,

              effect: JumpingDotEffect(
                activeDotColor: Colors.red,
                dotColor: Colors.grey,
                dotHeight: 10,
                dotWidth: 10,
                spacing: 16,
                verticalOffset: 10,
              ),
            )
          ],
        ));
  }
}
