import 'package:flutter/material.dart';
import 'package:shopping_app/models/color_model.dart';

class ColorData {
  static ColorModel reds = ColorModel(
    icon: Icons.circle,
    color: Colors.red,
  );
  static ColorModel blues = ColorModel(
    icon: Icons.circle,
    color: Colors.blue,
  );
  static ColorModel browns = ColorModel(
    icon: Icons.circle,
    color: Colors.brown,
  );
  static ColorModel greys = ColorModel(
    icon: Icons.circle,
    color: Colors.grey,
  );
  static ColorModel yellows = ColorModel(
    icon: Icons.circle,
    color: Colors.yellow,
  );
  static ColorModel whites = ColorModel(
    icon: Icons.circle,
    color: Colors.white,
  );
  static ColorModel ambers = ColorModel(
    icon: Icons.circle,
    color: Colors.amber,
  );
  static ColorModel indigos = ColorModel(
    icon: Icons.circle,
    color: Colors.indigo,
  );
  static ColorModel greens = ColorModel(
    icon: Icons.circle,
    color: Colors.green,
  );

  static final List<ColorModel> all = [
    reds,
    blues,
    browns,
    greys,
    yellows,
    whites,
    ambers,
    indigos,
    greens,
  ];
}
