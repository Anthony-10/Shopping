import 'package:shopping_app/models/product_items.dart';

class Repair {
  static ProductItems electricalTools = ProductItems(title: 'Electrical Tools');
  static ProductItems handTools = ProductItems(title: 'Hand Tools');
  static ProductItems buildingMaterials =
      ProductItems(title: 'Building Materials');

  static final List<ProductItems> all = [
    electricalTools,
    handTools,
    buildingMaterials,
  ];
}
