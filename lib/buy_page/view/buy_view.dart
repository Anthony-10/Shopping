import 'package:flutter/material.dart';

class BuyView extends StatefulWidget {
  final int index,value;

  const BuyView({Key key, this.index, this.value}) : super(key: key);

  @override
  _BuyViewState createState() => _BuyViewState();
}

class _BuyViewState extends State<BuyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),*/
      //drawer: NavigationDrawerBuy(),
      body: Column(
        children: [
          //TopView(),
          widget.index==widget.value?Center(child: Text("BuyPage")):Center(child: Text("BuyPage 2"))
        ],
      ),
    );
  }
}
