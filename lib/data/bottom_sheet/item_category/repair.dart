import 'package:shopping_app/models/product_items.dart';

class Repair {
  static ProductItems electricalTools = ProductItems(title: 'Electrical tools');
  static ProductItems handTools = ProductItems(title: 'Hand tools');
  static ProductItems buildingMaterials =
      ProductItems(title: 'Building materials');

  static final List<ProductItems> all = [
    electricalTools,
    handTools,
    buildingMaterials,
  ];
}
