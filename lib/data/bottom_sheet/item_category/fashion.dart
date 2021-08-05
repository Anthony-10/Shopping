import 'package:shopping_app/models/item_model.dart';

class Fashion {
  static ItemModel clothing = ItemModel(title: 'Clothing');
  static ItemModel shoes = ItemModel(title: 'Shoes');
  static ItemModel watches = ItemModel(title: 'Watches');
  static ItemModel clothingAccessories =
      ItemModel(title: 'Clothing Accessories');
  static ItemModel bugs = ItemModel(title: 'Bugs');
  static ItemModel jewelry = ItemModel(title: 'Jewelry');
  static final List<ItemModel> all = [
    clothing,
    shoes,
    watches,
    clothingAccessories,
    bugs,
    jewelry,
  ];
}
