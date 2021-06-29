import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/data/profile_category/product_category.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key key}) : super(key: key);

  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
                height: Get.height * 0.3,
                child: Center(
                    child: Column(
                  children: [
                    Text(
                      'Settings',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25.0),
                    ),
                    TextFormField(
                      key: const ValueKey("productName"),
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: "productName",
                        fillColor: Colors.red,
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                      keyboardType: TextInputType.text,
                      //controller: _productName,
                    ),
                  ],
                ))),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.indigo[50],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, top: 30.0, right: 10.0, bottom: 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                        children: ProductCategory.all
                            .map((item) => Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0)),
                                  child: ListTile(
                                    title: Text(item.text),
                                    subtitle: Text(item.subText),
                                    trailing: Icon(item.icon),
                                    onTap: () {},
                                  ),
                                  elevation: 20.0,
                                  shadowColor: Colors.black,
                                ))
                            .toList()),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
