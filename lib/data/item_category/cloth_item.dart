import 'package:shopping_app/models/product_items.dart';

class ClothItem {
  static ProductItems cap = ProductItems(title: 'Cap');
  static ProductItems vest = ProductItems(title: 'Vest');
  static ProductItems tshirt = ProductItems(title: 'T-shirt');
  static ProductItems jacket = ProductItems(title: 'Jacket');
  static ProductItems boxers = ProductItems(title: 'Boxers');
  static ProductItems belts = ProductItems(title: 'Belts');
  static ProductItems shorts = ProductItems(title: 'Shorts');
  static ProductItems trouser = ProductItems(title: 'Trouser');
  static ProductItems socks = ProductItems(title: 'Socks');
  static ProductItems shoes = ProductItems(title: 'Shoes');

  static final List<ProductItems> all = [
    cap,
    vest,
    tshirt,
    jacket,
    boxers,
    belts,
    shorts,
    trouser,
    socks,
    shoes,
  ];
}
