import 'package:shopping_app/models/item_model.dart';
import 'package:shopping_app/models/product_items.dart';

class Office {
  static ItemModel officeAccessories = ItemModel(title: 'Office Accessories');
  static ItemModel offices = ItemModel(title: 'Office');
  static ItemModel others = ItemModel(title: 'Others');

  static final List<ItemModel> all = [
    officeAccessories,
    offices,
    others,
  ];
}