import 'package:flutter/material.dart';
import 'package:shopping_app/core/widget/tab_bar/tab_bar.dart';

class SellView extends StatefulWidget {
  const SellView({Key key}) : super(key: key);

  @override
  _SellViewState createState() => _SellViewState();
}

class _SellViewState extends State<SellView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),*/
      //drawer: NavigationDrawerSell(),
      body: Column(
        children: [
          Expanded(child: TabBarPage()),
          //TopView(),
          Container(
            height: 80.0,
            child: ListTile(
              subtitle: TextButton.icon(
                onPressed: null,
                icon: Icon(
                  Icons.attach_money,
                  size: 30.0,
                  color: Colors.green,
                ),
                label: Text('12,000',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30.0, color: Colors.green)),
              ),
              title: Text(
                'Revenue',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, color: Colors.grey),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                crossAxisCount: 2,
                children: <Widget>[
                  Card(
                      child: ListTile(
                          title: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.people_outline),
                              label: Text("Users")),
                          subtitle: Text(
                            '7',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red, fontSize: 40.0),
                          ))),
                  Card(
                      child: ListTile(
                          title: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.category),
                              label: Expanded(child: Text("Categories"))),
                          subtitle: Text(
                            '20',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red, fontSize: 40.0),
                          ))),
                  Card(
                      child: ListTile(
                          title: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.track_changes),
                              label: Text("Products")),
                          subtitle: Text(
                            '2,000',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red, fontSize: 40.0),
                          ))),
                  Card(
                      child: ListTile(
                          title: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.tag_faces),
                              label: Text("Sold")),
                          subtitle: Text(
                            '1,000',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red, fontSize: 40.0),
                          ))),
                  Card(
                      child: ListTile(
                          title: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.shopping_cart_rounded),
                              label: Text("Orders")),
                          subtitle: Text(
                            '14',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red, fontSize: 40.0),
                          ))),
                  Card(
                      child: ListTile(
                          title: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.close),
                              label: Text("Return")),
                          subtitle: Text(
                            '2',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red, fontSize: 40.0),
                          ))),
                ]),
          )
        ],
      ),
    );
  }
}
