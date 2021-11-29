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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 20.0, right: 50.0),
              child: Container(
                  height: Get.height * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Settings',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25.0),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      TextFormField(
                        key: const ValueKey("Search"),
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          hintText: "Search",
                          fillColor: Colors.red,
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.search),
                          ),
                          /*enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(color: Colors.grey)),*/
                        ),
                        keyboardType: TextInputType.text,
                        //controller: _productName,
                      ),
                    ],
                  )),
            ),
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
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text('Account')
                          ],
                        ),
                        Column(
                            children: ProductCategory.all
                                .map((item) => Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
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
                      ],
                    ),
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
