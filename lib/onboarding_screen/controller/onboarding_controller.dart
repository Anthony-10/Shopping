import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/authentication/view/auth_view.dart';
import 'package:shopping_app/onboarding_screen/model/onboarding_model.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();
  forwardAction() {
    if (isLastPage) {
      Get.to(AuthView());
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnboardingModel> onboardingPages = [
    OnboardingModel("assets/onboarding/58915-online-shop.json", "Online"),
    OnboardingModel("assets/onboarding/36605-shopping-cart.json", "Buy"),
    OnboardingModel("assets/onboarding/76119-shop.json", "Sell"),
    OnboardingModel("assets/onboarding/4901-location-finding.json", "Location")
  ];
}
