import 'package:shopping_app/models/item_model.dart';
import 'package:shopping_app/models/product_items.dart';

class Vehicles {
  static ItemModel cars = ItemModel(title: 'Cars');
  static ItemModel vehicleParts = ItemModel(title: 'Vehicle Parts');
  static ItemModel buses = ItemModel(title: 'Buses');
  static ItemModel trucks = ItemModel(title: 'Trucks');
  static ItemModel motorcycles = ItemModel(title: 'Motorcycles');
  static ItemModel heavyEquipment = ItemModel(title: 'Heavy Equipment');
  static ItemModel watercraft = ItemModel(title: 'Watercraft');

  static final List<ItemModel> all = [
    cars,
    vehicleParts,
    buses,
    trucks,
    motorcycles,
    heavyEquipment,
    watercraft,
  ];
}
