import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/data/buy_drawer/buy_item.dart';
import 'package:shopping_app/data/sell_drawer/sell_item.dart';
import 'package:shopping_app/models/drawer_items.dart';

import '../../../../../favourites.dart';
import 'drawer_widget.dart';
import 'home_pages.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key key}) : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  double xOffset;
  double yOffset;
  double scaleFactor;
  bool isDrawerOpen;
  DrawerItem item = BuyDrawerItems.home;
  bool isDragging = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //openDrawer();
    closeDrawer();
  }

  closeDrawer() => setState(() {
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
        isDrawerOpen = false;
      });

  openDrawer() => setState(() {
        xOffset = 230;
        yOffset = 130;
        scaleFactor = 0.6;
        isDrawerOpen = true;
      });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(21, 30, 61, 1),
        body: Stack(
          children: [
            buildDrawer(),
            buildPage(),
          ],
        ));
  }

  buildDrawer() => SafeArea(
          child: Container(
        width: xOffset,
        child: DrawerWidget(
          onSelectedItem: (item) async {
            switch (item) {
              case BuyDrawerItems.logOut:
                Get.snackbar('massage', 'logOut');

                return;
              default:
                setState(() {
                  this.item = item;
                  closeDrawer();
                });
            }
          },
        ),
      ));

  buildPage() {
    return WillPopScope(
      onWillPop: () async {
        if (isDrawerOpen) {
          closeDrawer();
          return false;
        } else {
          return true;
        }
      },
      child: GestureDetector(
        onTap: closeDrawer,
        onHorizontalDragStart: (details) => isDragging = true,
        onHorizontalDragUpdate: (details) {
          if (!isDragging) return;

          const delta = 1;
          if (details.delta.dx > delta) {
            openDrawer();
          } else if (details.delta.dx < -delta) {
            closeDrawer();
          }

          isDragging = false;
        },
        child: AnimatedContainer(
            duration: Duration(milliseconds: 250),
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(scaleFactor),
            child: AbsorbPointer(
                absorbing: isDrawerOpen,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(isDrawerOpen ? 20 : 0),
                  child: Container(
                      color: isDrawerOpen ? Colors.white12 : Colors.blue,
                      child: HomePages(openDrawer: openDrawer)),
                ))),
      ),
    );
  }

  Widget getDrawerPage() {
    switch (item) {
      case BuyDrawerItems.home:
        return HomePages(openDrawer: openDrawer);
      case BuyDrawerItems.favourites:
      default:
        return Favourites(openDrawer: openDrawer);
    }
  }
}
