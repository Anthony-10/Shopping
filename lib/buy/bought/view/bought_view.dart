import 'package:flutter/material.dart';
import 'bought.dart';

class BoughtView extends StatefulWidget {
  const BoughtView({Key key}) : super(key: key);

  @override
  _BoughtViewState createState() => _BoughtViewState();
}

class _BoughtViewState extends State<BoughtView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bought'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Pending'),
              Tab(text: 'Bought'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text('Pending'),
            ),
            BoughtItem()
          ],
        ),
      ),
    );
  }
}
