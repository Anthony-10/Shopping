import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Others extends StatefulWidget {
  const Others({Key key}) : super(key: key);

  @override
  _OthersState createState() => _OthersState();
}

class _OthersState extends State<Others> {
  final TextEditingController _productName = TextEditingController();
  final TextEditingController _productSize = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TextFormField(
          key: const ValueKey("productName"),
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            hintText: "ProductName",
          ),
          keyboardType: TextInputType.text,
          controller: _productName,
        ),
        SizedBox(
          height: 30.0,
        ),
        TextFormField(
          key: const ValueKey("productSize"),
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            hintText: "ProductSize",
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          controller: _productSize,
        ),
        SizedBox(
          height: 30.0,
        ),
        ElevatedButton(
          onPressed: () {
            /*  if (_productName.text.isNotEmpty &&
                                _productSize.text.isNotEmpty) {
                               addProductsController.addProducts(
                                    _productName.text, _productSize.text);
                              Get.snackbar('message', 'product details added');
                            } else if (_productName.text.isEmpty) {
                              Get.snackbar('message', 'Enter ProductName');
                            } else {
                              if (_productSize.text.isEmpty) {
                                Get.snackbar('message', 'Enter ProductSize');
                              }
                            }*/
          },
          child: Text('Continue'),
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
          ),
        )
      ],
    ));
  }
}
