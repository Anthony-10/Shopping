import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/model/slide_model.dart';

class SlideController extends GetxController {
  //var selectedPageIndex = 0.obs;
  //final controller = PageController();
  List<SlideModel> homePageData = [
    SlideModel('assets/slide1.png'),
    SlideModel('assets/slide2.png'),
    SlideModel('assets/slide4.png')
  ];
}
