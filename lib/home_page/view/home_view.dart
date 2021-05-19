import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/wiget/top_bar/view/top_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Container(
              height: 40.0,
              child: Center(
                child: Text(
                  'BUY',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
            ),
            TopView(),
          ],
        ),
      ),
    );
  }
}
