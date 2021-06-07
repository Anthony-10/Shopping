import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/add_products/binding/addproducts_binding.dart';
import 'package:shopping_app/sell_page/view/sell_view.dart';

import 'add_products/view/addproducts_view.dart';
import 'buy_page/view/buy_view.dart';
import 'core/widget/tab_bar/view/tab_bar.dart';

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
        GetPage(name: "/buy_view", page: ()=> BuyView()),
        GetPage(name: "/sell_view", page: ()=> SellView(), binding: AddProductcBinding()),
        GetPage(name: "/tab_bar", page: ()=> TabBarPage()),
        GetPage(name: "/add_products_view", page: ()=> AddProductsView()),
      ],

     initialRoute: "/buy_view",
    );
  }
}


