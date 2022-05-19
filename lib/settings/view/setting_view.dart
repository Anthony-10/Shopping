import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/sell/data/profile_category/product_category.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key key}) : super(key: key);

  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.23,
              width: Get.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                    Colors.indigo[800],
                    Colors.indigo[600],
                    Colors.indigo[400],
                    Colors.indigo[300]
                  ]),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.11, top: Get.height * 0.16),
                child: Text(
                  'Settings',
                  style: TextStyle(fontSize: 25, color: Colors.white54),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.11, top: Get.height * 0.05),
                child: Column(children: [
                  Text('GENERAL'),
                  Container(
                    width: Get.width,
                    height: Get.height,
                    child: ListView(
                        children:
                            ListTile.divideTiles(context: context, tiles: [
                      ListTile(
                        title: Text('Theme mode'),
                      )
                    ]).toList()),
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
