import 'package:flutter/material.dart';
import 'package:shopping_app/core/widget/top_bar/view/top_view.dart';
import 'package:shopping_app/drawer/navigation_drawer_buy.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'BUY',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),
      drawer: NavigationDrawerBuy(),
      body: Column(
        children: [
          TopView(),
        ],
      ),
    );
  }
}
