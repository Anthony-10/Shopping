import 'package:shopping_app/models/product_items.dart';

class CarItem {
  static ProductItems alternator = ProductItems(title: 'Alternator');
  static ProductItems battery = ProductItems(title: 'Battery');
  static ProductItems starterMotor = ProductItems(title: 'Starter motor');
  static ProductItems discDrake = ProductItems(title: 'Disc brake');
  static ProductItems distributor = ProductItems(title: 'Distributor');
  static ProductItems sparkPlug = ProductItems(title: 'Spark plug');
  static ProductItems radiator = ProductItems(title: 'Radiator');
  static ProductItems carLights = ProductItems(title: 'Car lights');

  static final List<ProductItems> all = [
    alternator,
    battery,
    starterMotor,
    discDrake,
    distributor,
    sparkPlug,
    radiator,
    carLights,
  ];
}
