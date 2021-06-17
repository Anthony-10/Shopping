import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/add_products/view/addproducts_view.dart';
import 'package:shopping_app/core/widget/drawer/controller/drawer_controller.dart';
import 'package:shopping_app/core/widget/tab_bar/new_tab.dart';
import 'package:shopping_app/data/sell_drawer/sell_item.dart';
import 'package:shopping_app/data/buy_drawer/buy_item.dart';
import 'package:shopping_app/models/drawer_items.dart';
import 'package:shopping_app/orders/view/oders_view.dart';
import 'package:shopping_app/products/view/product_view.dart';
import 'package:shopping_app/profile/view/profile_view.dart';
import 'package:shopping_app/sell_location/view/sell_location.dart';

import '../../../../../../favourites.dart';
import '../drawer_widget.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({Key key}) : super(key: key);

  @override
  _DrawerViewState createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
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

  final initialindex = Get.put(InitialIndex());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[400],
        //fromRGBO(21, 30, 61, 1),
        body: Stack(
          children: [
            buildDrawer(),
            buildPage(),
          ],
        ));
  }

  buildDrawer() => SafeArea(child: Container(
        //width: xOffset,
        child: DrawerWidget(
          onSelectedItem: (item) async {
            switch (item) {
              case BuyDrawerItems.logOut:
                Get.snackbar('massage', 'logOut');
                return;
              case SellDrawerItems.logOut:
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

  Widget buildPage() {
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
                    color: isDrawerOpen ? Colors.grey[200] : Colors.white,
                    child: initialindex.initialIndex == 0
                        ? getBuyPage()
                        : getSellPage()),
              ),
            )),
      ),
    );
  }

  Widget getBuyPage() {
    switch (item) {
      case BuyDrawerItems.favourites:
        return Favourites();
      case BuyDrawerItems.home:
      default:
        return NewTab();
    }
  }

  Widget getSellPage() {
    switch (item) {
      case SellDrawerItems.profile:
        return ProfileView();
      case SellDrawerItems.product:
        return ProductView();
      case SellDrawerItems.addProducts:
        return AddProductsView();
      case SellDrawerItems.orders:
        return OrdersView();
      case SellDrawerItems.location:
        return SellLocation();
      case SellDrawerItems.sellPage:
      default:
        return NewTab();
    }
  }
}
