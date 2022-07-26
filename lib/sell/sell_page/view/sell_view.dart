import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
import 'package:shopping_app/core/service/data_base_service.dart';

class SellView extends StatefulWidget {
  const SellView({Key key}) : super(key: key);

  @override
  _SellViewState createState() => _SellViewState();
}

class _SellViewState extends State<SellView> {
  final DatabaseService databaseService = Get.put(DatabaseService());
  final buyController = Get.put(BuyController());
  String uid = FirebaseAuth.instance.currentUser.uid;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseService.getCounterNumber();
    buyController.getLikeCount(ids: uid);
  }

  @override
  Widget build(BuildContext context) {
    databaseService.getCounterNumber();
    buyController.getLikeCount(ids: uid);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0))),
            height: Get.height * 0.2,
            child: Center(
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
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.indigo[50],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  crossAxisCount: 2,
                  physics: BouncingScrollPhysics(),
                  children: [
                    Card(
                      child: ListTile(
                          title: TextButton.icon(
                              onPressed: () {
                                /*setState(() {
                                this.element = element;
                              });
                              */ /*getPage();*/ /*
                              print('${element.label},llllllllllllll');*/
                              },
                              icon: Icon(Icons.people_outline),
                              label: Text("Users")),
                          subtitle: Text(
                            '${buyController.likes}',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red, fontSize: 40.0),
                          )),
                      elevation: 20.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    Card(
                      child: ListTile(
                          title: TextButton.icon(
                              onPressed: () {
                                /*setState(() {
                                this.element = element;
                              });
                              */ /*getPage();*/ /*
                              print('${element.label},llllllllllllll');*/
                              },
                              icon: Icon(Icons.category),
                              label: Text("Categories")),
                          subtitle: Obx(() => Text(
                                "${databaseService.categories}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 40.0),
                              ))),
                      elevation: 20.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    Card(
                      child: ListTile(
                          title: TextButton.icon(
                              onPressed: () {
                                /*setState(() {
                                this.element = element;
                              });
                              */ /*getPage();*/ /*
                              print('${element.label},llllllllllllll');*/
                              },
                              icon: Icon(Icons.track_changes),
                              label: Text("Products")),
                          subtitle: Obx(() => Text(
                                '${databaseService.products}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 40.0),
                              ))),
                      elevation: 20.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    Card(
                      child: ListTile(
                          title: TextButton.icon(
                              onPressed: () {
                                /*setState(() {
                                this.element = element;
                              });
                              */ /*getPage();*/ /*
                              print('${element.label},llllllllllllll');*/
                              },
                              icon: Icon(Icons.tag_faces),
                              label: Text("Sold")),
                          subtitle: Obx(() => Text(
                                '${databaseService.sold}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 40.0),
                              ))),
                      elevation: 20.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    Card(
                      child: ListTile(
                          title: TextButton.icon(
                              onPressed: () {
                                /*setState(() {
                                this.element = element;
                              });
                              */ /*getPage();*/ /*
                              print('${element.label},llllllllllllll');*/
                              },
                              icon: Icon(Icons.shopping_cart_rounded),
                              label: Text("Orders")),
                          subtitle: Obx(() => Text(
                                '${databaseService.order}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 40.0),
                              ))),
                      elevation: 20.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    Card(
                      child: ListTile(
                          title: TextButton.icon(
                              onPressed: () {
                                /*setState(() {
                                this.element = element;
                              });
                              */ /*getPage();*/ /*
                              print('${element.label},llllllllllllll');*/
                              },
                              icon: Icon(Icons.close),
                              label: Text("Returns")),
                          subtitle: Obx(() => Text(
                                '${databaseService.returns}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 40.0),
                              ))),
                      elevation: 20.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
