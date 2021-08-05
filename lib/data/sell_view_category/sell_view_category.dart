import 'package:flutter/material.dart';
import 'package:shopping_app/models/sell_view_model.dart';

class SellViewCategory {
  static SellViewItems users = SellViewItems(
    label: "Users",
    subtitle: '7',
    icon: Icons.people_outline,
  );
  static SellViewItems categories = SellViewItems(
    label: "Categories",
    subtitle: '20',
    icon: Icons.category,
  );
  static SellViewItems products = SellViewItems(
    label: "Products",
    subtitle: '2000',
    icon: Icons.track_changes,
  );
  static SellViewItems sold = SellViewItems(
    label: "Sold",
    subtitle: '1000',
    icon: Icons.tag_faces,
  );
  static SellViewItems orders = SellViewItems(
    label: "Orders",
    subtitle: '14',
    icon: Icons.shopping_cart_rounded,
  );
  static SellViewItems returns = SellViewItems(
    label: "Returns",
    subtitle: '7',
    icon: Icons.close,
  );

  static List<SellViewItems> all = [
    users,
    categories,
    products,
    sold,
    orders,
    returns,
  ];
}
