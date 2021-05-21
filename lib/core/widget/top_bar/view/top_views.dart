import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopView extends StatelessWidget {

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
                  Get.offAllNamed("/buy_view");
                },
              ),
              InkWell(
                child: Text(
                  "Sell",
                  style:
                  TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                onTap: (){
                  Get.offAllNamed("/sell_view");
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
