import 'package:shopping_app/models/product_items.dart';

class House {
  static ProductItems houseAccessories =
      ProductItems(title: 'houseAccessories');
  static ProductItems furniture = ProductItems(title: 'Furniture');
  static ProductItems kitchenAppliances =
      ProductItems(title: 'Kitchen appliances');
  static ProductItems houseAppliances = ProductItems(title: 'House appliances');
  static ProductItems garden = ProductItems(title: 'Garden');

  static final List<ProductItems> all = [
    houseAccessories,
    furniture,
    kitchenAppliances,
    houseAppliances,
    garden,
  ];
}
