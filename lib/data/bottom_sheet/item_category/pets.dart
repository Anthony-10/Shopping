import 'package:shopping_app/models/product_items.dart';

class Pets {
  static ProductItems petsAccessories = ProductItems(title: 'Pets Accessories');
  static ProductItems dogs = ProductItems(title: 'Dogs & Puppies');
  static ProductItems fish = ProductItems(title: 'Fish');
  static ProductItems birds = ProductItems(title: 'Birds');
  static ProductItems carts = ProductItems(title: 'Carts & Kittens');
  static ProductItems otherAnimals = ProductItems(title: 'Other Animals');

  static final List<ProductItems> all = [
    petsAccessories,
    dogs,
    fish,
    birds,
    carts,
    otherAnimals,
  ];
}
