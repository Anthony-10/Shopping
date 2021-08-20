import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellerAccount extends StatefulWidget {
  const SellerAccount({Key key}) : super(key: key);

  @override
  _SellerAccountState createState() => _SellerAccountState();
}

class _SellerAccountState extends State<SellerAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: Get.height * 3,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
        )
      ]),
    );
  }
}
