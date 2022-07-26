import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/settings/settings_data.dart';

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
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: Get.width * 0.05,
                      right: Get.width * 0.05,
                      top: Get.height * 0.05,
                      bottom: Get.height * 0.05),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('GENERAL'),
                        Card(
                          child: Column(
                            children: SettingsGenegalData.all
                                .map(
                                  (item) => ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 8.0),
                                    leading: Icon(
                                      item.iconData,
                                      color: Colors.black,
                                    ),
                                    title: Text(
                                      item.name,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    trailing: Icon(Icons.arrow_forward_ios),
                                  ),
                                )
                                .toList(),
                          ),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('FEEDBACK'),
                        Card(
                          child: Column(
                            children: SettingsFeedBackData.all
                                .map(
                                  (item) => ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 8.0),
                                    leading: Icon(
                                      item.iconData,
                                      color: Colors.black,
                                    ),
                                    title: Text(
                                      item.name,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    trailing: Icon(Icons.arrow_forward_ios),
                                  ),
                                )
                                .toList(),
                          ),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
