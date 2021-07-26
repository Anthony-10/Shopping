import 'package:shopping_app/models/product_items.dart';

class Vehicles {
  static ProductItems cars = ProductItems(title: 'Cars');
  static ProductItems vehicleParts = ProductItems(title: 'Vehicle parts');
  static ProductItems buses = ProductItems(title: 'Buses');
  static ProductItems trucks = ProductItems(title: 'Trucks');
  static ProductItems motorcycles = ProductItems(title: 'Motorcycles');
  static ProductItems heavyEquipment = ProductItems(title: 'Heavy equipment');
  static ProductItems watercraft = ProductItems(title: 'Watercraft');

  static final List<ProductItems> all = [
    cars,
    vehicleParts,
    buses,
    trucks,
    motorcycles,
    heavyEquipment,
    watercraft,
  ];
}
