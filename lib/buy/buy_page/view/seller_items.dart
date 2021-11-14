import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';

class SellerItem extends StatefulWidget {
  const SellerItem({Key key}) : super(key: key);

  @override
  _SellerItemState createState() => _SellerItemState();
}

class _SellerItemState extends State<SellerItem> {
  final buyController = Get.put(BuyController());
  final heights = Get.height;
  final widths = Get.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Container(
              height: heights,
              width: widths,
              decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Colors.indigo[800],
                Colors.indigo[600],
                Colors.indigo[400],
                Colors.indigo[300]
              ])),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () => Get.back(),
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          buyController.productElement.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          buyController.itemElement.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                      ),
                      /*Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Price',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),*/
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: heights * .28),
                      child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: Colors.indigo[50],
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25.0),
                                topLeft: Radius.circular(25.0))),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: heights * .12,
                              right: widths * .03,
                              left: heights * .03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Column(
                                  children: [
                                    Text('Color',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15)),
                                    Container(
                                      height: heights * .03,
                                      width: widths * .2,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 4,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                            margin: EdgeInsets.all(4),
                                            height: 10,
                                            width: 12,
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                shape: BoxShape.circle),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: widths * .4,
                                ),
                                Column(
                                  children: [
                                    Text('Size',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15)),
                                    Text('Ksh 20')
                                  ],
                                )
                              ]),
                              SizedBox(
                                height: heights * .02,
                              ),
                              SingleChildScrollView(
                                child: Text(
                                    'we are Accessing hidden method Lsun/misc/'
                                    'Unsafe;->putLong(Ljava/lang/Object;JJ)V (greylist, '
                                    'linking, allowed) EGLint new_window_surface'
                                    '(egl_winsys_display *, void *, EGLSurface, EGLConfig, '
                                    'egl_winsys_surface **, EGLBoolean) returns 0x3000'),
                              ),
                              SizedBox(
                                height: heights * .02,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: heights * .04,
                                    width: widths * .1,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(70)),
                                    child: Icon(Icons.add),
                                  ),
                                  SizedBox(
                                    width: widths * .03,
                                  ),
                                  Text('23'),
                                  SizedBox(
                                    width: widths * .03,
                                  ),
                                  Container(
                                    height: heights * .04,
                                    width: widths * .1,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(70)),
                                    child: Icon(Icons.add),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: widths * .1,
              top: heights * .33,
              child: Text(
                'Price',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Positioned(
                top: heights * .24,
                right: widths * .1,
                child: Image.network(
                  buyController.sellerProduct,
                  fit: BoxFit.fill,
                  height: heights * .3,
                  width: widths * .4,
                ))
          ],
        ),
      ),
    );
  }
}
