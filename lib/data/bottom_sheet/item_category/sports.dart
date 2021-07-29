import 'package:shopping_app/models/item_model.dart';
import 'package:shopping_app/models/product_items.dart';

class Sports {
  static ItemModel sportsEquipment = ItemModel(title: 'Sports Equipment');
  static ItemModel games = ItemModel(title: 'Games');
  static ItemModel musicalInstrument = ItemModel(title: 'Musical Instrument');
  static ItemModel arts = ItemModel(title: 'Arts');
  static ItemModel campingGear = ItemModel(title: 'Camping Gear');

  static final List<ItemModel> all = [
    sportsEquipment,
    games,
    musicalInstrument,
    arts,
    campingGear,
  ];
}
