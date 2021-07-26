import 'package:shopping_app/models/product_items.dart';

class Electronics {
  static ProductItems computerAccessories =
      ProductItems(title: 'Computer accessories');
  static ProductItems laptops = ProductItems(title: 'Laptops & Computers');
  static ProductItems tv = ProductItems(title: 'Tv');
  static ProductItems security = ProductItems(title: 'Security');
  static ProductItems network = ProductItems(title: 'network');
  static ProductItems printer = ProductItems(title: 'Printer & Scanner');
  static ProductItems others = ProductItems(title: 'Others');

  static final List<ProductItems> all = [
    computerAccessories,
    laptops,
    tv,
    security,
    network,
    printer,
    others
  ];
}
