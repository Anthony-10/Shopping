import 'package:shopping_app/models/product_items.dart';

class ProductCategories {
  static ProductItems clothes = ProductItems(title: 'Clothes');
  static ProductItems car = ProductItems(title: 'Car');
  static ProductItems bakary = ProductItems(title: 'Bakary');
  static ProductItems house = ProductItems(title: 'House');

  static final List<ProductItems> all = [
    clothes,
    car,
    bakary,
    house,
  ];
}
