import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/buy_page/view/buy_view.dart';
import 'package:shopping_app/core/widget/drawer/controller/drawer_controller.dart';
import 'package:shopping_app/sell/sell_page/view/sell_view.dart';

class NewTab extends StatefulWidget {
  @override
  _NewTabState createState() => _NewTabState();
}

class _NewTabState extends State<NewTab> {
  final drawerFunctions = Get.put(DrawerFunctions());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: drawerFunctions.initialIndex,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: Get.height * 0.09,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0))),
                //width: Get.width * 0.25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          drawerFunctions.initialIndex = 0;
                        });
                      },
                      child: Container(
                        width: Get.width * 0.30,
                        height: Get.height * 0.05,
                        decoration: BoxDecoration(
                            color: drawerFunctions.initialIndex == 0
                                ? Colors.black
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Center(
                          child: Text(
                            'Buy',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          drawerFunctions.initialIndex = 1;
                        });
                      },
                      child: Container(
                        width: Get.width * 0.30,
                        height: Get.height * 0.05,
                        decoration: BoxDecoration(
                            color: drawerFunctions.initialIndex == 1
                                ? Colors.black
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Center(
                          child: Text(
                            'Sell',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              /*SizedBox(
                  height: Get.height * 0.03,
                  child:
              DecoratedBox(decoration: BoxDecoration(color: Colors.red)),
              ),*/
              Expanded(
                  child: drawerFunctions.initialIndex == 0
                      ? BuyView()
                      : SellView())
            ],
          ),
        ),
      ),
    );
  }
}
