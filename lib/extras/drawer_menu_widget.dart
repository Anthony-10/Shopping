import 'package:flutter/material.dart';

class DrawerMenuWidget extends StatelessWidget {
  final VoidCallback onClicked;
  const DrawerMenuWidget({Key key, this.onClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onClicked, icon: Icon(Icons.menu));
  }
}
