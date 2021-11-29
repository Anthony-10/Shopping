import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';
import 'package:shopping_app/sell/data/bottom_sheet/check_box_category.dart';

class SizeCheckBox extends StatefulWidget {
  const SizeCheckBox({Key key}) : super(key: key);

  @override
  _SizeCheckBoxState createState() => _SizeCheckBoxState();
}

class _SizeCheckBoxState extends State<SizeCheckBox> {
  AddProductsController addProductsController =
      Get.put(AddProductsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.4,
      child: Wrap(
        children: CheckBoxCategories.all
            .map(
              (e) => CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.blue,
                title: Text(e.text),
                value: e.value,
                onChanged: (
                  unValue,
                ) {
                  setState(() {
                    e.value = unValue;
                    addProductsController.checkBoxElement = e.text;
                    addProductsController.checkBoxValue = e.value;
                  });
                  print(addProductsController.checkBoxElement);
                  print(addProductsController.checkBoxValue);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
