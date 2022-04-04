import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
import 'package:shopping_app/core/service/data_base_service.dart';
import 'package:shopping_app/sell/data/sell_view_category/sell_view_category.dart';
import 'package:shopping_app/sell/models/sell_view_model.dart';
import 'package:shopping_app/sell/orders/view/orders_view.dart';
import 'package:shopping_app/sell/products/view/product_view.dart';
import 'package:shopping_app/sell/sell_page/controller/sell_controller.dart';

class SellView extends StatefulWidget {
  const SellView({Key key}) : super(key: key);

  @override
  _SellViewState createState() => _SellViewState();
}

class _SellViewState extends State<SellView> {
  //SellViewItems element = SellViewCategory.product;
  final DatabaseService databaseService = Get.put(DatabaseService());
  final buyController = Get.put(BuyController());

  var lengths;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*getData();*/
    databaseService.getCounterNumber();
    buyController.getLikeCount();
    print('$lengths,----------------------');
  }

  @override
  Widget build(BuildContext context) {
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
                          subtitle: Text(
                            "${databaseService.categories}",
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
                              icon: Icon(Icons.track_changes),
                              label: Text("Products")),
                          subtitle: Text(
                            '${databaseService.products}',
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
                              icon: Icon(Icons.tag_faces),
                              label: Text("Sold")),
                          subtitle: Text(
                            '${databaseService.sold}',
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
                              icon: Icon(Icons.shopping_cart_rounded),
                              label: Text("Orders")),
                          subtitle: Text(
                            '${databaseService.order}',
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
                              icon: Icon(Icons.close),
                              label: Text("Returns")),
                          subtitle: Text(
                            '${databaseService.returns}',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red, fontSize: 40.0),
                          )),
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

  /*Widget getPage() {
    print(element);
    switch (element) {
      */ /*case SellViewCategory.products:
        return ProductView();*/ /*
      case SellViewCategory.orders:
        return OrdersView();
      */ /* case SellViewCategory.users:
        return BoughtView();*/ /*
      */ /* case BuyDrawerItems.location:
        return BuyerLocation();*/ /*
      case SellViewCategory.products:
      default:
        return ProductView();
    }
  }*/

  /*Future<int> getData() async {
    try {
      Query<Map<String, dynamic>> documentSnapshot = FirebaseFirestore.instance
          .collection('Users')
          .where("userId", isEqualTo: FirebaseAuth.instance.currentUser.uid);
      if (documentSnapshot != null) {
        setState(() {
          lengths = documentSnapshot.snapshots().length;
        });
      } else {
        print('wewe');
      }
    } catch (e) {
      print(e);
    }
    return lengths;
  }*/

  /*Future<void> getData() async {
    final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    try {
      query = _fireStore
          .collection("Products")
          .where("userId", isEqualTo: FirebaseAuth.instance.currentUser.uid)
          .parameters
          .length;
      print('$query,----------------------');
      */ /*.where("userId", isEqualTo: FirebaseAuth.instance.currentUser.uid)
          .snapshots()
          .length;*/ /*

    } catch (e) {
      print(e);
    }
  }*/

}
