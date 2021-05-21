import 'package:flutter/material.dart';
import 'package:shopping_app/core/widget/drawer/navigation_drawer_buy.dart';
import 'package:shopping_app/core/widget/top_bar/view/top_views.dart';

class BuyView extends StatefulWidget {
  const BuyView({Key key}) : super(key: key);

  @override
  _BuyViewState createState() => _BuyViewState();
}

class _BuyViewState extends State<BuyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Center(
          child: Text(
            'BUY',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black),
          ),
        ),
      ),
      drawer: NavigationDrawerBuy(),
      body: Column(
        children: [
          TopView(),
          Center(child: Text("BuyPage"))
        ],
      ),
    );
  }
}
