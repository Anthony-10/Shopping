import 'package:shopping_app/models/product_items.dart';

class Agriculture {
  static const farmMachinery = ProductItems(title: 'FarmMachinery');
  static const liveStock = ProductItems(title: 'LiveStock');
  static const meals = ProductItems(title: 'Meals');
  static const feeds = ProductItems(title: 'Feeds & Seeds');

  static final List<ProductItems> all = [
    farmMachinery,
    liveStock,
    meals,
    feeds,
  ];
}
