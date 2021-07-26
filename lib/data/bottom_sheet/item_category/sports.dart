import 'package:shopping_app/models/product_items.dart';

class Sports {
  static ProductItems sportsEquipment = ProductItems(title: 'Sports equipment');
  static ProductItems games = ProductItems(title: 'Games');
  static ProductItems musicalInstrument =
      ProductItems(title: 'Musical instrument');
  static ProductItems arts = ProductItems(title: 'Arts');
  static ProductItems campingGear = ProductItems(title: 'Camping gear');

  static final List<ProductItems> all = [
    sportsEquipment,
    games,
    musicalInstrument,
    arts,
    campingGear,
  ];
}
