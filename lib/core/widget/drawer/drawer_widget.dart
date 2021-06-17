import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/widget/drawer/controller/drawer_controller.dart';
import 'package:shopping_app/data/buy_drawer/buy_item.dart';
import 'package:shopping_app/data/sell_drawer/sell_item.dart';
import 'package:shopping_app/models/drawer_items.dart';

class DrawerWidget extends StatelessWidget {
  final ValueChanged<DrawerItem> onSelectedItem;
  DrawerWidget({Key key, this.onSelectedItem,}) : super(key: key);

  final initialindex = Get.put(InitialIndex());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            buildDrawerItems(context),
          ],
        ),
      ),
    );
  }

  buildDrawerItems(BuildContext context) => Column(
      children: initialindex.initialIndex == 0
          ? BuyDrawerItems.all
              .map((item) => ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                    leading: Icon(
                      item.icon,
                      color: Colors.black,
                    ),
                    title: Text(
                      item.title,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onTap: () => onSelectedItem(item),
                  ))
              .toList()
          : SellDrawerItems.all
              .map((item) => ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                    leading: Icon(
                      item.icon,
                      color: Colors.black,
                    ),
                    title: Text(
                      item.title,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onTap: () => onSelectedItem(item),
                  ))
              .toList());
}
