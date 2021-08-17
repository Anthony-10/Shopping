import 'package:shopping_app/sell/models/item_model.dart';

class Agriculture {
  static ItemModel farmMachinery = ItemModel(title: 'FarmMachinery');
  static ItemModel liveStock = ItemModel(title: 'LiveStock');
  static ItemModel meals = ItemModel(title: 'Meals');
  static ItemModel feeds = ItemModel(title: 'Feeds & Seeds');

  static final List<ItemModel> all = [
    farmMachinery,
    liveStock,
    meals,
    feeds,
  ];
}
