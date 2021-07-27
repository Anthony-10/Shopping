import 'package:shopping_app/models/product_items.dart';

class House {
  static ProductItems houseAccessories =
      ProductItems(title: 'House Accessories');
  static ProductItems furniture = ProductItems(title: 'Furniture');
  static ProductItems kitchenAppliances =
      ProductItems(title: 'Kitchen Appliances');
  static ProductItems houseAppliances = ProductItems(title: 'House Appliances');
  static ProductItems garden = ProductItems(title: 'Garden');

  static final List<ProductItems> all = [
    houseAccessories,
    furniture,
    kitchenAppliances,
    houseAppliances,
    garden,
  ];
}
