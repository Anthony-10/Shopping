import 'package:flutter/material.dart';
import 'package:shopping_app/sell/models/sell_view_model.dart';

class SellViewCategory {
  static const SellViewItems users = SellViewItems(
    label: "Users",
    subtitle: '7',
    icon: Icons.people_outline,
  );
  static const SellViewItems categories = SellViewItems(
    label: "Categories",
    subtitle: '20',
    icon: Icons.category,
  );
  static const SellViewItems products = SellViewItems(
    label: "Products",
    subtitle: '2000',
    icon: Icons.track_changes,
  );
  static const SellViewItems sold = SellViewItems(
    label: "Sold",
    subtitle: '1000',
    icon: Icons.tag_faces,
  );
  static const SellViewItems orders = SellViewItems(
    label: "Orders",
    subtitle: '14',
    icon: Icons.shopping_cart_rounded,
  );
  static const SellViewItems returns = SellViewItems(
    label: "Returns",
    subtitle: '7',
    icon: Icons.close,
  );

  static final List<SellViewItems> all = [
    users,
    categories,
    products,
    sold,
    orders,
    returns,
  ];
}
