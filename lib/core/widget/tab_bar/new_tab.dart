import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy_page/view/buy_view.dart';
import 'package:shopping_app/core/widget/drawer/controller/drawer_controller.dart';
import 'package:shopping_app/core/widget/drawer/drawer_widget.dart';
import 'package:shopping_app/sell_page/view/sell_view.dart';

class NewTab extends StatefulWidget {
  //final int initialIndex;

  //const NewTab({Key key, this.initialIndex}) : super(key: key);

  @override
  _NewTabState createState() => _NewTabState();
}

class _NewTabState extends State<NewTab> {
  final initialindex = Get.put(InitialIndex());



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: initialindex.initialIndex,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          //appBar: DrawerWidget(index: initialIndex,),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: Get.height * 0.05,
                //width: Get.width * 0.25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          initialindex.initialIndex = 0;
                        });
                      },
                      child: Container(
                        width: Get.width * 0.30,
                        decoration: BoxDecoration(
                            color:
                            initialindex.initialIndex == 0 ? Colors.black : Colors.grey,
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
                          initialindex.initialIndex = 1;
                        });
                      },
                      child: Container(
                        width: Get.width * 0.30,
                        decoration: BoxDecoration(
                            color:
                            initialindex.initialIndex == 1 ? Colors.black : Colors.grey,
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
              Expanded(child: initialindex.initialIndex == 0 ? BuyView() : SellView())
            ],
          ),
        ),
      ),
    );
  }
}
