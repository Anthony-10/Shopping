import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';
import 'package:shopping_app/sell/data/bottom_sheet/color_data.dart';

class ColorChekBox extends StatefulWidget {
  const ColorChekBox({Key key}) : super(key: key);

  @override
  _ColorChekBoxState createState() => _ColorChekBoxState();
}

class _ColorChekBoxState extends State<ColorChekBox> {
  AddProductsController addProductsController =
      Get.put(AddProductsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.4,
      child: Wrap(
        children: ColorData.all
            .map(
              (colorE) => CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.blue,
                title: Icon(
                  colorE.icon,
                  color: colorE.color,
                ),
                value: colorE.value,
                onChanged: (unValue) {
                  setState(() {
                    colorE.value = unValue;
                    addProductsController.colorElement = colorE.color;
                    addProductsController.colorValue = colorE.value;
                  });
                  print(addProductsController.colorElement);
                  print(addProductsController.colorValue);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
