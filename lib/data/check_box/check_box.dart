import 'package:shopping_app/models/check_box.dart';

class CheckBoxItems {
  static  CheckBoxItem clothes = CheckBoxItem(title: 'Clothes');
  static  CheckBoxItem carTools = CheckBoxItem(title: 'CarTools');
  static  CheckBoxItem bakary = CheckBoxItem(title: 'Bakary');

  static final List<CheckBoxItem> all= [
    clothes,
    carTools,
    bakary,
  ];

}