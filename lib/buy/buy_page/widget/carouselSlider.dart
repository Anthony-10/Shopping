import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/data/slide_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSliderPage extends StatefulWidget {
  const CarouselSliderPage({Key key}) : super(key: key);

  @override
  _CarouselSliderPageState createState() => _CarouselSliderPageState();
}

class _CarouselSliderPageState extends State<CarouselSliderPage> {
  int activeIndex = 0;
  final controller = SlideController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Get.height * 0.3,
          width: Get.width,
          child: CarouselSlider.builder(
            options: CarouselOptions(
                onPageChanged: (index, reason) =>
                    setState(() => activeIndex = index),
                viewportFraction: 1,
                height: Get.height * 0.6,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayAnimationDuration: Duration(seconds: 2),
                autoPlayInterval: Duration(seconds: 5),
                aspectRatio: 18 / 8),
            itemCount: controller.homePageData.length,
            itemBuilder: (context, index, realIndex) {
              final image = controller.homePageData[index].imageAsset;
              return Container(
                height: Get.height * 0.6,
                width: Get.width,
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
    );
  }
}
