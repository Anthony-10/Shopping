import 'package:flutter/material.dart';
import 'package:shopping_app/data/sell_view_category/sell_view_category.dart';

class SellView extends StatefulWidget {
  const SellView({Key key}) : super(key: key);

  @override
  _SellViewState createState() => _SellViewState();
}

class _SellViewState extends State<SellView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
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
                children: SellViewCategory.all
                    .map(
                      (element) => Card(
                        child: ListTile(
                            title: TextButton.icon(
                                onPressed: () {},
                                icon: Icon(element.icon),
                                label: Expanded(child: Text(element.label))),
                            subtitle: Text(
                              element.subtitle,
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.red, fontSize: 40.0),
                            )),
                        elevation: 20.0,
                      ),
                    )
                    .toList()),
          )
        ],
      ),
    );
  }
}
