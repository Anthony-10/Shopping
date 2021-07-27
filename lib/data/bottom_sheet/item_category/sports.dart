import 'package:shopping_app/models/product_items.dart';

class Sports {
  static ProductItems sportsEquipment = ProductItems(title: 'Sports Equipment');
  static ProductItems games = ProductItems(title: 'Games');
  static ProductItems musicalInstrument =
      ProductItems(title: 'Musical Instrument');
  static ProductItems arts = ProductItems(title: 'Arts');
  static ProductItems campingGear = ProductItems(title: 'Camping Gear');

  static final List<ProductItems> all = [
    sportsEquipment,
    games,
    musicalInstrument,
    arts,
    campingGear,
  ];
}
