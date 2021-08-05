import 'package:shopping_app/models/item_model.dart';

class Electronics {
  static ItemModel computerAccessories =
      ItemModel(title: 'Computer Accessories');
  static ItemModel laptops = ItemModel(title: 'Laptops & Computers');
  static ItemModel tv = ItemModel(title: 'Tv');
  static ItemModel security = ItemModel(title: 'Security');
  static ItemModel network = ItemModel(title: 'Network');
  static ItemModel printer = ItemModel(title: 'Printer & Scanner');
  static ItemModel others = ItemModel(title: 'Others');

  static final List<ItemModel> all = [
    computerAccessories,
    laptops,
    tv,
    security,
    network,
    printer,
    others
  ];
}
