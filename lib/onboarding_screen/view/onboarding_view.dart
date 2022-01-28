import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/onboarding_screen/controller/onboarding_controller.dart';

class OnboardingView extends StatelessWidget {
  final _controller = OnboardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          PageView.builder(
              controller: _controller.pageController,
              onPageChanged: _controller.selectedPageIndex,
              itemCount: _controller.onboardingPages.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Stack(
                    children: [
                      Image.asset(
                        _controller.onboardingPages[index].imageAsset,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Center(
                        child: Text(_controller.onboardingPages[index].title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 50.0,
                                color: Colors.amberAccent)),
                      ),
                    ],
                  ),
                );
              }),
          Positioned(
            bottom: 20,
            left: 20,
            child: Row(
              children: List.generate(
                  _controller.onboardingPages.length,
                  (index) => Obx(() {
                        return Container(
                          margin: EdgeInsets.all(4),
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              color:
                                  _controller.selectedPageIndex.value == index
                                      ? Colors.red
                                      : Colors.white,
                              shape: BoxShape.circle),
                        );
                      })),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: FloatingActionButton(
              elevation: 0,
              onPressed: () {
                _controller.forwardAction();
              },
              child: Obx(() {
                return Text(_controller.isLastPage ? "Start" : "Next");
              }),
            ),
          )
        ]),
      ),
    );
  }
}
