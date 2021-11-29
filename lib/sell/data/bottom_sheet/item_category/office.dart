import 'package:shopping_app/sell/models/item_model.dart';

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
