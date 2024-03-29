import 'package:flutter/material.dart';
import 'package:shopping_app/sell/models/drawer_model.dart';

class SellDrawerItems {
  static const sellPage = DrawerItem(title: 'Sell Page', icon: Icons.home);
  static const product = DrawerItem(title: 'Product', icon: Icons.email);
  static const addProducts = DrawerItem(title: 'Add products', icon: Icons.add);
  static const orders =
      DrawerItem(title: 'Orders', icon: Icons.shopping_basket);
  static const location = DrawerItem(title: 'Location', icon: Icons.map);
  static const settings = DrawerItem(title: 'Settings', icon: Icons.settings);
  static const about = DrawerItem(title: 'About', icon: Icons.help);
  static const logOut = DrawerItem(title: 'log Out', icon: Icons.logout);

  static final List<DrawerItem> all = [
    sellPage,
    product,
    addProducts,
    orders,
    location,
    settings,
    about,
    logOut,
  ];
}
