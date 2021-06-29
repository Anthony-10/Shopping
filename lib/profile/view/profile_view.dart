import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/data/product_category/product_category.dart';
import 'package:shopping_app/data/profile_category/product_category.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 50, left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Profile',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                ),
              )),
          Container(
            margin: EdgeInsets.only(top: 20, left: 20),
            child: Row(children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 50.0,
                    child: Icon(
                      Icons.person,
                      size: Get.height * 0.1,
                    ),
                  ),
                  Positioned(
                      bottom: -3,
                      right: -3,
                      child: IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                          size: 30.0,
                        ),
                        onPressed: () {},
                      ))
                ],
              ),
              SizedBox(
                width: 20.0,
              ),
              Column(children: [
                Text('Ambros Kim',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Aweru@gmail.com'),
              ]),
            ]),
          ),
          SizedBox(
            height: 50.0,
          ),
          Column(
              children: ProductCategory.all
                  .map((item) => Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
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
    ));
  }
}
