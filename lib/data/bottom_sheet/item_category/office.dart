import 'package:shopping_app/models/product_items.dart';

class Office {
  static const officeAccessories = ProductItems(title: 'Office Accessories');
  static const office = ProductItems(title: 'Office');
  static const others = ProductItems(title: 'Others');

  static final List<ProductItems> all = [
    officeAccessories,
    office,
    others,
  ];
}
