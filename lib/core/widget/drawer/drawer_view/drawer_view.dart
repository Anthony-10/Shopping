import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/authentication/controller/auth_controller.dart';
import 'package:shopping_app/buy/bought/view/bought_view.dart';
import 'package:shopping_app/buy/buy_location/view/buyer_location.dart';
import 'package:shopping_app/buy/cart/view/cart_view.dart';
import 'package:shopping_app/buy/data/buy_drawer/buy_item.dart';
import 'package:shopping_app/core/widget/drawer/controller/drawer_controller.dart';
import 'package:shopping_app/core/widget/tab_bar/new_tab.dart';
import 'package:shopping_app/sell/add_products/view/addproducts_view.dart';
import 'package:shopping_app/sell/data/sell_drawer/sell_item.dart';
import 'package:shopping_app/sell/models/drawer_model.dart';
import 'package:shopping_app/sell/orders/view/orders_view.dart';
import 'package:shopping_app/sell/products/view/product_view.dart';
import 'package:shopping_app/sell/sell_location/view/sell_location.dart';
import 'package:shopping_app/sell/settings/view/setting_view.dart';

import '../../../../buy/favourite/favourites.dart';
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
        xOffset = 210;
        yOffset = 170;
        scaleFactor = 0.6;
        isDrawerOpen = true;
      });

  final drawerFunctions = Get.put(DrawerFunctions());
  final authController = Get.find<AuthController>();

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
                authController.signOut();
                Get.snackbar('massage', 'logOut');
                return;
              case SellDrawerItems.logOut:
                authController.signOut();
                Get.snackbar('massage', 'logOut');
                return;

              default:
                setState(() {
                  this.item = item;
                  print(item.title);
                  print(item);
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
                    child: drawerFunctions.initialIndex == 0
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
      case BuyDrawerItems.cart:
        return CartView();
      case BuyDrawerItems.bought:
        return BoughtView();
      case BuyDrawerItems.location:
        return BuyerLocation();
      case BuyDrawerItems.home:
      default:
        return NewTab();
    }
  }

  Widget getSellPage() {
    switch (item) {
      case SellDrawerItems.settings:
        return SettingView();
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
