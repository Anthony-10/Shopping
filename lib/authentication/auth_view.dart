import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/widget/drawer/drawer_view/drawer_view.dart';

class AuthView extends StatefulWidget {
  //const LoginView({Key key}) : super(key: key);

  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final TextEditingController _UserName = TextEditingController();
  final TextEditingController _UserEmail = TextEditingController();
  final TextEditingController _UserPassWord = TextEditingController();

  int initialIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: Get.height,
                width: Get.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        colors: [
                      Colors.indigo[800],
                      Colors.indigo[600],
                      Colors.indigo[400],
                      Colors.indigo[300]
                    ])),
                child: Column(
                  children: [
                    Container(
                        height: Get.height * 0.5,
                        width: Get.width,
                        child: initialIndex == 0
                            ? Align(
                                alignment: Alignment(-0.5, -0.1),
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 35.0),
                                ),
                              )
                            : Align(
                                alignment: Alignment(-0.5, -0.1),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 35.0),
                                ),
                              )),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.indigo[50],
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25.0),
                                topLeft: Radius.circular(25.0))),
                      ),
                    ),
                  ],
                ),
              ),
              /*Container(
                */ /*height: Get.height * 0.5,
                width: Get.width,*/ /*
                decoration: BoxDecoration(
                  color: Colors.red,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0))),
              ),*/
              /*Image.asset(
                "assets/login.jpg",
                fit: BoxFit.cover,
                height: Get.height,
                width: Get.width,
              ),*/
              /* Positioned(
                  top: 80.0,
                  left: 120.0,
                  child: initialIndex == 0
                      ? Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white, fontSize: 35.0),
                        )
                      : Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 35.0),
                        )),*/
              Positioned(
                  bottom: 70.0,
                  left: 50.0,
                  right: 50.0,
                  child: initialIndex == 0
                      ? Container(
                          height: Get.height * 0.6,
                          width: Get.width * 0.8,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                20.0, 40.0, 20.0, 30.0),
                            child: Column(
                              children: [
                                TextFormField(
                                  key: const ValueKey("UserName"),
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                  ),
                                  controller: _UserName,
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  key: const ValueKey("UserPassWord"),
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                    hintText: "PassWord",
                                  ),
                                  controller: _UserPassWord,
                                ),
                                SizedBox(
                                  height: 40.0,
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text('Forgot Your PassWord?')),
                                SizedBox(
                                  height: 30.0,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Get.to(() => DrawerView());
                                    },
                                    child: Text('Sign In')),
                                SizedBox(
                                  height: 20.0,
                                ),
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        initialIndex = 1;
                                      });
                                      //Get.to(() => SignUp());
                                    },
                                    child: Text('Sign Up'))
                              ],
                            ),
                          ),
                        )
                      : Container(
                          height: Get.height * 0.6,
                          width: Get.width * 0.8,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                20.0, 40.0, 20.0, 30.0),
                            child: Column(
                              children: [
                                TextFormField(
                                  key: const ValueKey("UserName"),
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                    hintText: "Name",
                                  ),
                                  controller: _UserName,
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  key: const ValueKey("UserPassWord"),
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                  ),
                                  controller: _UserEmail,
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  key: const ValueKey("UserEmail"),
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                    hintText: "PassWord",
                                  ),
                                  controller: _UserPassWord,
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                ElevatedButton(
                                    onPressed: () {}, child: Text('Sign In')),
                                SizedBox(
                                  height: 20.0,
                                ),
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        initialIndex = 0;
                                      });
                                      //Get.to(() => LoginView());
                                    },
                                    child: Text('Sign In'))
                              ],
                            ),
                          ),
                        ))
            ],
          ),
        ),
      ),
    );
  }
}
