import 'package:shopping_app/models/item_model.dart';
import 'package:shopping_app/models/product_items.dart';

class Health {
  static ItemModel bath = ItemModel(title: 'Bath & Body');
  static ItemModel hairBeauty = ItemModel(title: 'Hair Beauty');
  static ItemModel makeup = ItemModel(title: 'Makeup');
  static ItemModel tools = ItemModel(title: 'Tools & Accessories');
  static ItemModel vitamin = ItemModel(title: 'Vitamins & Supplements');
  static ItemModel skinCare = ItemModel(title: 'Skin Care');

  static final List<ItemModel> all = [
    bath,
    hairBeauty,
    makeup,
    tools,
    vitamin,
    skinCare,
  ];
}
