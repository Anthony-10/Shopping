import 'package:flutter/material.dart';
import 'package:shopping_app/core/widget/tab_bar/tab_bar.dart';

class HomePages extends StatelessWidget {
  final VoidCallback openDrawer;
  const HomePages({Key key, this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: TabBarPage(),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   leading: DrawerMenuWidget(onClicked: openDrawer),
      // ),
    );
  }
}
