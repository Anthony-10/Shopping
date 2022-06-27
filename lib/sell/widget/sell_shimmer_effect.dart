import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class SellShimmerEffect extends StatelessWidget {
  const SellShimmerEffect({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
                  child: Container(
                    height: Get.height * .03,
                    width: Get.width * .3,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
