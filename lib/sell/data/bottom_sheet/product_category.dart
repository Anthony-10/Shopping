import 'package:shopping_app/sell/models/product_model.dart';

class ProductCategories {
  static const fashion = ProductItems(title: 'Fashion');
  static const vehicle = ProductItems(title: 'Vehicle');
  static const house = ProductItems(title: 'House');
  static const office = ProductItems(title: 'Office');
  static const agriculture = ProductItems(title: 'Agriculture');
  static const pets = ProductItems(title: 'Animal');
  static const electronics = ProductItems(title: 'Electronics');
  static const health = ProductItems(title: 'Health');
  static const repair = ProductItems(title: 'Repair');
  static const sports = ProductItems(title: 'Sports');
  static const others = ProductItems(title: 'Others');

  static final List<ProductItems> all = [
    fashion,
    vehicle,
    house,
    office,
    agriculture,
    pets,
    electronics,
    health,
    repair,
    sports,
    others,
  ];
}
