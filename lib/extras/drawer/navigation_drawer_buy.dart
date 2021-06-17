/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationDrawerBuy extends StatefulWidget {
  final int index;

  const NavigationDrawerBuy({Key key, this.index}) : super(key: key);
  @override
  _NavigationDrawerBuyState createState() => _NavigationDrawerBuyState();
}

class _NavigationDrawerBuyState extends State<NavigationDrawerBuy> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // header
          UserAccountsDrawerHeader(
            accountName: const Text('anthony'),
            accountEmail: const Text('anthony@gmail.com'),
            currentAccountPicture: GestureDetector(
              child: const CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
            //     decoration: BoxDecoration(color: Colors.white),
          ),

          // body

          InkWell(
            child: ListTile(
              onTap: () {
                Get.offNamed("buyHomePage");
              },
              title: const Text('Home Page'),
              leading: const Icon(
                Icons.home,
                color: Colors.blue,
              ),
            ),
          ),

          InkWell(
            child: ListTile(
              onTap: () {
                Get.offNamed("favourites");
              },
              title: const Text('Favourites'),
              leading: const Icon(
                Icons.favorite,
                color: Colors.blue,
              ),
            ),
          ),

          InkWell(
            child: ListTile(
              onTap: () {
                Get.offNamed("cart");
              },
              title: const Text('Shopping cart'),
              leading: const Icon(
                Icons.shopping_cart,
                color: Colors.blue,
              ),
            ),
          ),

          InkWell(
            child: ListTile(
              onTap: () {
                Get.offNamed("bought");
              },
              title: const Text('Bought'),
              leading: const Icon(
                Icons.shop,
                color: Colors.blue,
              ),
            ),
          ),

          InkWell(
            child: ListTile(
              onTap: () {
                Get.offNamed("favourites");
              },
              title: const Text('Try It'),
              leading: const Icon(
                Icons.favorite,
                color: Colors.blue,
              ),
            ),
          ),

          InkWell(
            child: ListTile(
              onTap: () {
                Get.offNamed("locationBuy");
              },
              title: const Text('Location'),
              leading: const Icon(
                Icons.map,
                color: Colors.blue,
              ),
            ),
          ),

          const Divider(),

          InkWell(
            child: ListTile(
              onTap: () {},
              title: const Text('Settings'),
              leading: const Icon(Icons.settings),
            ),
          ),
          InkWell(
            child: ListTile(
              onTap: () {},
              title: const Text('About'),
              leading: const Icon(Icons.help),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),

          InkWell(
            child: ListTile(
              onTap: () {},
              title: const Text('log Out'),
              leading: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
    );
  }
}
*/
