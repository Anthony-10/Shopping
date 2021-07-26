import 'package:shopping_app/models/product_items.dart';

class ClothItem {
  static ProductItems clothing = ProductItems(title: 'Clothing');
  static ProductItems shoes = ProductItems(title: 'Shoes');
  static ProductItems watches = ProductItems(title: 'Watches');
  static ProductItems clothingAccessories =
      ProductItems(title: 'Clothing accessories');
  static ProductItems bugs = ProductItems(title: 'Bugs');
  static ProductItems jewelry = ProductItems(title: 'Jewelry');
  static final List<ProductItems> all = [
    clothing,
    shoes,
    watches,
    clothingAccessories,
    bugs,
    jewelry,
  ];
}
