import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/widget/tab_bar/new_tab.dart';

class BuyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.transparent,
         /* appBar: AppBar(
            *//* iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,*//*
            elevation: 0.0,
          ),*/
          //drawer: NavigationDrawerBuy(),
          body: Column(children: [
            Center(child: Text("wewe"))
          ])
          //TabBarPage()
          ),
    );
  }
}
