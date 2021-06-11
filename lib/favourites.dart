import 'package:flutter/material.dart';
import 'package:shopping_app/core/widget/new_drawer/drawer_menu_widget.dart';



class Favourites extends StatelessWidget {
  final VoidCallback openDrawer;
  const Favourites({Key key, this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DrawerMenuWidget(onClicked: openDrawer),
      ),
      body: Center(child: Text('favourites')),
    );
  }
}
