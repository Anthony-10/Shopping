import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class list_title extends StatelessWidget{
  final Function function;
  final String name;
  const list_title({Key key, this.function, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return ListTile(
     onTap: () {
       function();
     },
     title: Text(
       name,
       style: TextStyle(color: Colors.white),
     ),
     leading: const Icon(
       Icons.home,
       color: Colors.white,
     ),
   );
  }

}