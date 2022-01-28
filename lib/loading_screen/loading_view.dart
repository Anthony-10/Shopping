import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/authentication/register_status/register_statuse.dart';
import 'package:shopping_app/onboarding_screen/view/onboarding_view.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  int initScreen;

  @override
  void initState() {
    super.initState();
    _getStatusPref();

    Timer(
        const Duration(seconds: 3),
        () => Get.to(
              () => initScreen == 0 || initScreen == null
                  ? OnboardingView()
                  : RegisterStatus(),
            ));
  }

  Future<void> _getStatusPref() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    initScreen = preferences.getInt('initScreen');
    await preferences.setInt('initScreen', 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.indigo[800],
          Colors.indigo[600],
          Colors.indigo[400],
          Colors.indigo[300]
        ])),
        child: Center(
          child: Text(
            "G-SELL",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50.0,
                color: Colors.amberAccent),
          ),
        ),
      ),
    );
  }
}
