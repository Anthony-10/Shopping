import 'package:flutter/material.dart';
import 'package:shopping_app/data/bottom_sheet/color_data.dart';

class ColorModel {
  final IconData icon;
  final Color color;
  bool value;

  ColorModel({this.icon, this.color, this.value = false});
}
