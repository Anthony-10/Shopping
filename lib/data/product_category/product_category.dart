import 'package:shopping_app/models/product_items.dart';

class ProductCategories {
  static const clothes = ProductItems(title: 'Clothes');
  static const car = ProductItems(title: 'Car');
  static const bakary = ProductItems(title: 'Bakary');
  static const house = ProductItems(title: 'House');

  static final List<ProductItems> all = [
    clothes,
    car,
    bakary,
    house,
  ];
}
