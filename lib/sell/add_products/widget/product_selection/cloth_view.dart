import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/sell/data/bottom_sheet/item_category/fashion.dart';

class ClothView extends StatefulWidget {
  const ClothView({Key key}) : super(key: key);

  @override
  _ClothViewState createState() => _ClothViewState();
}

class _ClothViewState extends State<ClothView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: Fashion.all
          .map((element) => GestureDetector(
                onTap: () {
                  setState(() {
                    Get.back();
                    //TODO
                    print(element.title);
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  height: Get.height * 0.05,
                  width: Get.width * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                      child: Text(
                    element.title,
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ))
          .toList(),
    );
  }
}
