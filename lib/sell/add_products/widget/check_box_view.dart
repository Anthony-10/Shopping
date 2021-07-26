import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/data/bottom_sheet/check_box_category.dart';

class CheckBoxView extends StatefulWidget {
  const CheckBoxView({Key key}) : super(key: key);

  @override
  _CheckBoxViewState createState() => _CheckBoxViewState();
}

class _CheckBoxViewState extends State<CheckBoxView> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: CheckBoxCategories.all
          .map((element) => CheckboxListTile(
                activeColor: Colors.blue,
                value: value,
                title: Text(element.text),
                onChanged: (value) => setState(() => this.value = !value),
              ))
          .toList(),
    );
  }
}
