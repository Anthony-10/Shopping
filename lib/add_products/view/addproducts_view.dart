import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddProductsView extends StatefulWidget {
  const AddProductsView({Key key}) : super(key: key);

  @override
  _AddProductsViewState createState() => _AddProductsViewState();
}

class _AddProductsViewState extends State<AddProductsView> {
  final TextEditingController _productName = TextEditingController();
  final TextEditingController _productSize = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: true,
          child: Column(
            children: [
              Container(
                child: Center(
                    child: Text(
                  "Add Product",
                  style: TextStyle(fontSize: 20.0),
                )),
                height: 40.0,
              ),
              Container(
                height: 200.0,
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          child: IconButton(
                              onPressed: () {}, icon: Icon(Icons.add)),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          child: IconButton(
                              onPressed: () {}, icon: Icon(Icons.add)),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          child: IconButton(
                              onPressed: () {}, icon: Icon(Icons.add)),
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextFormField(
                key: const ValueKey("productName"),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "productName",
                  //fillColor: Colors.grey,
                  //filled: true,
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(30.0),
                  // )
                ),
                keyboardType: TextInputType.text,
                // style: TextStyle(
                //   color: Colors.white,
                // ),
                controller: _productName,
              ),
              SizedBox(
                height: 30.0,
              ),
              TextFormField(
                key: const ValueKey("productSize"),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "productSize",
                  //fillColor: Colors.grey,
                  //filled: true,
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(30.0),
                  // )
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                // style: TextStyle(
                //   color: Colors.white,
                // ),
                controller: _productSize,
              ),
            ],
          )),
    );
  }
}
