import 'package:flutter/material.dart';
import 'package:shopping_app/buy_page/view/buy_view.dart';
import 'package:shopping_app/core/widget/drawer/drawer_widget.dart';
import 'package:shopping_app/sell_page/view/sell_view.dart';

class TabBarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabBarPageState();
  }
}

class _TabBarPageState extends State<TabBarPage> {
  int initialIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: initialIndex,
        child: Scaffold(
            appBar: AppBar(
              bottom: PreferredSize(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        initialIndex == 0
                            ? Container(
                                child: Center(
                                  child: Text(
                                    "Buy",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black),
                                  ),
                                ),
                                height: 40,
                                width: 150,
                                color: Colors.blue.withOpacity(0.4),
                              )
                            : InkWell(
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      "Buy",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13,
                                          color: Colors.black54),
                                    ),
                                  ),
                                  height: 40,
                                  width: 150,
                                ),
                                onTap: () {
                                  setState(() {
                                    initialIndex = 0;
                                  });
                                },
                              ),
                        initialIndex == 1
                            ? Container(
                                child: Center(
                                  child: Text(
                                    "Sell",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black),
                                  ),
                                ),
                                height: 40,
                                width: 150,
                                color: Colors.blue.withOpacity(0.4),
                              )
                            : InkWell(
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      "Sell",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13,
                                          color: Colors.black54),
                                    ),
                                  ),
                                  height: 40,
                                  width: 150,
                                ),
                                onTap: () {
                                  setState(() {
                                    initialIndex = 1;
                                  });
                                },
                              ),
                      ],
                    ),
                  ),
                  preferredSize: Size.fromHeight(4.0)),
              title: Text(""),
              elevation: 50.0,
              backgroundColor: Colors.grey,
            ),
            //drawer: NavigationDrawerBuy(index: initialIndex,),
            body: initialIndex == 0 ? BuyView() : SellView()

            /*DrawerWidget(
              index: initialIndex,
            )*/
            )); /*initialIndex == 0 ? SideViewBuy(index: initialIndex,) : SideViewSell()))*/
    /*appBar: AppBar(
              bottom: (
                tabs: [
                  Tab(child: Text('Buy'),),
                  Tab(child: Text('Sell')),
                ],
              ),
              title: Text('Tabs Demo'),
            ),
            body: TabBarView(children: [
              BuyView(),
              SellView(),
            ])*/
  }
  /*void change(){
    setState(() {
      initialIndex=0;
    });
  }*/
}
