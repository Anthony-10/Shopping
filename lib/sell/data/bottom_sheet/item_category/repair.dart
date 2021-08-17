import 'package:shopping_app/sell/models/item_model.dart';

class Repair {
  static ItemModel electricalTools = ItemModel(title: 'Electrical Tools');
  static ItemModel handTools = ItemModel(title: 'Hand Tools');
  static ItemModel buildingMaterials = ItemModel(title: 'Building Materials');

  static final List<ItemModel> all = [
    electricalTools,
    handTools,
    buildingMaterials,
  ];
}
