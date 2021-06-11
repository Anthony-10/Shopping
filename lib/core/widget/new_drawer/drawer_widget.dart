import 'package:flutter/material.dart';
import 'package:shopping_app/data/buy_drawer/buy_item.dart';
import 'package:shopping_app/data/sell_drawer/sell_item.dart';
import 'package:shopping_app/models/drawer_items.dart';

class DrawerWidget extends StatefulWidget {
  final ValueChanged<DrawerItem> onSelectedItem;
  final int index;
  const DrawerWidget({Key key, this.onSelectedItem, this.index})
      : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  //int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildDrawerItems(context),
          ],
        ),
      ),
    );
  }

  buildDrawerItems(BuildContext context) => Column(
      children: widget.index == 0
          ? BuyDrawerItems.all
              .map((item) => ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                    leading: Icon(
                      item.icon,
                      color: Colors.white,
                    ),
                    title: Text(
                      item.title,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () => widget.onSelectedItem(item),
                  ))
              .toList()
          : SellDrawerItems.all
              .map((item) => ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                    leading: Icon(
                      item.icon,
                      color: Colors.white,
                    ),
                    title: Text(
                      item.title,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () => widget.onSelectedItem(item),
                  ))
              .toList());
}
