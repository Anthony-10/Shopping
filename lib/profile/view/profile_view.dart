import 'package:flutter/material.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Profile',style: TextStyle(fontSize: 20.0),)),
    );
  }
}
