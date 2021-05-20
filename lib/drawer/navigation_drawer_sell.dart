import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationDrawerSell extends StatefulWidget {
  @override
  _NavigationDrawerSellState createState() => _NavigationDrawerSellState();
}

class _NavigationDrawerSellState extends State<NavigationDrawerSell> {
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
              title: const Text('Buy'),
              leading: const Icon(
                Icons.shopping_basket,
                color: Colors.blue,
              ),
            ),
          ),

          InkWell(
            child: ListTile(
              onTap: () {
                Get.offNamed("homeSell");
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
                Get.offNamed("profile");
              },
              title: const Text('Profile'),
              leading: const Icon(
                Icons.person,
                color: Colors.blue,
              ),
            ),
          ),
          InkWell(
            child: ListTile(
              onTap: () {
                Get.offNamed("orders");
              },
              title: const Text('Orders'),
              leading: const Icon(
                Icons.shopping_basket,
                color: Colors.blue,
              ),
            ),
          ),
          InkWell(
            child: ListTile(
              onTap: () {
                Get.offNamed("LocationSell");
              },
              title: const Text('Location'),
              leading: const Icon(
                Icons.map,
                color: Colors.blue,
              ),
            ),
          ),

          InkWell(
            child: ListTile(
              onTap: () {
                Get.offNamed("products");
              },
              title: const Text('Product'),
              leading: const Icon(
                Icons.email,
                color: Colors.blue,
              ),
            ),
          ),

          InkWell(
            child: ListTile(
              onTap: () {
                Get.offNamed("addProducts");
              },
              title: const Text('Add products'),
              leading: const Icon(
                Icons.add,
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
              onTap: () {
              },
              title: const Text('log Out'),
              leading: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
    );
  }
}
