import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class BuyShimmerEffect extends StatelessWidget {
  const BuyShimmerEffect({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[500],
            highlightColor: Colors.grey[100],
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: Get.height * .15,
                          width: Get.width * .25,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: 20.0,
                            color: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * .15,
                        ),
                        Container(
                          width: Get.width * .2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: Get.height * .01,
                                width: Get.width * .3,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: Get.height * .02,
                              ),
                              Container(
                                height: Get.height * .01,
                                width: Get.width * .3,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: Get.height * .02,
                              ),
                              Container(
                                height: Get.height * .01,
                                width: Get.width * .3,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        });
  }
}
