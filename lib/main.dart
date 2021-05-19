import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/home_page/view/home_view.dart';
import 'package:shopping_app/sell_page/view/sell_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',

      getPages: [
        GetPage(name: "/home_view", page: ()=> HomeView()),
        GetPage(name: "/sell_view", page: ()=> SellView())
      ],

     initialRoute: "/home_view",
    );
  }
}


