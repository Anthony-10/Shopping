import 'package:flutter/material.dart';



class Favourites extends StatelessWidget {
  //final VoidCallback openDrawer;
  //const Favourites({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   leading: DrawerMenuWidget(onClicked: openDrawer),
        // ),
        body: Center(child: Text('favourites')),
      ),
    );
  }
}
