import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                        icon: Icon(Icons.camera_alt, size: 30.0,),
                        onPressed: (){},
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
            height: 20.0,
          ),
          ListTile(
            title: Text('Language'),
            subtitle: Text('Swahili'),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          )
        ],
      ),
    ));
  }
}
