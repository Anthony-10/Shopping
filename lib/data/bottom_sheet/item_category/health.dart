import 'package:shopping_app/models/product_items.dart';

class Health {
  static ProductItems bath = ProductItems(title: 'Bath & Body');
  static ProductItems hairBeauty = ProductItems(title: 'Hair beauty');
  static ProductItems makeup = ProductItems(title: 'Makeup');
  static ProductItems tools = ProductItems(title: 'Tools & Accessories');
  static ProductItems vitamin = ProductItems(title: 'Vitamins & Supplements');
  static ProductItems skinCare = ProductItems(title: 'Skin care');

  static final List<ProductItems> all = [
    bath,
    hairBeauty,
    makeup,
    tools,
    vitamin,
    skinCare,
  ];
}
