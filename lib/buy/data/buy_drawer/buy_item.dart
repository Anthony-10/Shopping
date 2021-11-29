import 'package:flutter/material.dart';
import 'package:shopping_app/sell/models/drawer_model.dart';

class BuyDrawerItems {
  static const home = DrawerItem(title: 'Home', icon: Icons.home);
  static const favourites =
      DrawerItem(title: 'Favourites', icon: Icons.favorite);
  static const cart = DrawerItem(title: 'Cart', icon: Icons.shopping_cart);
  static const bought = DrawerItem(title: 'Bought', icon: Icons.shop);
  static const tryIt = DrawerItem(title: 'Try It', icon: Icons.favorite);
  static const location = DrawerItem(title: 'Location', icon: Icons.map);
  static const settings = DrawerItem(title: 'Settings', icon: Icons.settings);
  static const about = DrawerItem(title: 'About', icon: Icons.help);
  static const logOut = DrawerItem(title: 'log Out', icon: Icons.logout);

  static final List<DrawerItem> all = [
    home,
    favourites,
    cart,
    bought,
    tryIt,
    location,
    settings,
    about,
    logOut,
  ];
}
