import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/authentication/view/login.dart';
import 'package:shopping_app/authentication/view/register.dart';
import 'package:shopping_app/sell/add_products/binding/addproducts_binding.dart';
import 'package:shopping_app/sell/add_products/view/addproducts_view.dart';
import 'package:shopping_app/sell/sell_page/view/sell_view.dart';

import 'authentication/binding/binding.dart';
import 'authentication/register_status/register_statuse.dart';
import 'authentication/view/auth_view.dart';
import 'buy/buy_page/view/buy_view.dart';
import 'core/service/local_notification_service.dart';
import 'core/widget/drawer/drawer_view/drawer_view.dart';
import 'loading_screen/loading_view.dart';

///Receive message when app is in the background solution for a message
Future<void> backGroundHandler(RemoteMessage message) async {
  print("backGroundHandler>>>>>>>>>>>>>>>>>>>>>>>>>");
  print(message.data.toString());
  print(message.notification.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService.initialize();
  await Firebase.initializeApp();
  print('onBackgroundMessage>>>>>>>>>>>>>>>>>>>>>>>');
  FirebaseMessaging.onBackgroundMessage(backGroundHandler);
  print('onBackgroundMessage end>>>>>>>>>>>>>>>>>>>>>>>');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      defaultTransition: Transition.fade,
      getPages: [
        GetPage(name: "/buy_view", page: () => BuyView()),
        GetPage(
            name: "/sell_view",
            page: () => SellView(),
            binding: AddProductcBinding()),
        /*GetPage(
            name: "/tab_bar",
            page: () => TabBarPage(),
            binding: AddProductcBinding()),*/
        GetPage(
            name: "/add_products_view",
            page: () => AddProductsView(),
            binding: AddProductcBinding()),
        GetPage(
            name: "/home_drawer",
            page: () => DrawerView(),
            bindings: [AddProductcBinding(), AuthBinding()]),
        GetPage(
            name: "/auth_view",
            page: () => AuthView(),
            bindings: [AddProductcBinding(), AuthBinding()]),
        GetPage(name: "/login", page: () => Login(), binding: AuthBinding()),
        GetPage(
            name: "/register", page: () => Register(), binding: AuthBinding()),
        GetPage(
            name: "/register_status",
            page: () => RegisterStatus(),
            binding: AuthBinding()),
        GetPage(
            name: "/loading_screen",
            page: () => LoadingScreen(),
            binding: AuthBinding()),
      ],
      initialRoute: "/loading_screen",
    );
  }
}
