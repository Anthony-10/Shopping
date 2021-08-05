import 'package:shopping_app/models/item_model.dart';

class Pets {
  static ItemModel petsAccessories = ItemModel(title: 'Pets Accessories');
  static ItemModel dogs = ItemModel(title: 'Dogs & Puppies');
  static ItemModel fish = ItemModel(title: 'Fish');
  static ItemModel birds = ItemModel(title: 'Birds');
  static ItemModel carts = ItemModel(title: 'Carts & Kittens');
  static ItemModel otherAnimals = ItemModel(title: 'Other Animals');

  static final List<ItemModel> all = [
    petsAccessories,
    dogs,
    fish,
    birds,
    carts,
    otherAnimals,
  ];
}
