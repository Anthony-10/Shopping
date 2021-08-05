import 'package:shopping_app/models/item_model.dart';

class House {
  static ItemModel houseAccessories = ItemModel(title: 'House Accessories');
  static ItemModel furniture = ItemModel(title: 'Furniture');
  static ItemModel kitchenAppliances = ItemModel(title: 'Kitchen Appliances');
  static ItemModel houseAppliances = ItemModel(title: 'House Appliances');
  static ItemModel garden = ItemModel(title: 'Garden');

  static final List<ItemModel> all = [
    houseAccessories,
    furniture,
    kitchenAppliances,
    houseAppliances,
    garden,
  ];
}
