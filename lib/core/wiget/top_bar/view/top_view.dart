import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopView extends StatelessWidget {
  const TopView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: Text(
                  "Buy",
                  style:
                  TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                onTap: (){
                  Get.toNamed("/home_view");
                },
              ),
              InkWell(
                child: Text(
                  "Sell",
                  style:
                  TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                onTap: (){
                  Get.toNamed("/sell_view");
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
