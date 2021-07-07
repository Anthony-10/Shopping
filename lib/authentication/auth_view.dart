import 'package:animated_text_kit/animated_text_kit.dart';
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
                                child: DefaultTextStyle(
                                  style: TextStyle(
                                      fontSize: 35.0, color: Colors.white),
                                  child: AnimatedTextKit(
                                    isRepeatingAnimation: false,
                                    //pause: Duration(microseconds: 30000),
                                    animatedTexts: [
                                      TypewriterAnimatedText(
                                          'Welcome'
                                          '\nBack',
                                          speed: Duration(milliseconds: 60)),
                                    ],
                                    /*style: TextStyle(
                                      color: Colors.white, fontSize: 35.0)*/
                                  ),
                                ),
                              )
                            : Align(
                                alignment: Alignment(-0.5, -0.1),
                                child: DefaultTextStyle(
                                  style: TextStyle(
                                      fontSize: 35.0, color: Colors.white),
                                  child: Text(
                                    'Create'
                                    '\nAccount',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 35.0),
                                  ),
                                ),
                              )),
                    Expanded(
                      child: Container(
                        child: Align(
                          alignment: Alignment(0.9, 0.7),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.mail,
                                    size: 30.0,
                                    color: Colors.red,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.facebook,
                                    size: 30.0,
                                    color: Colors.blue,
                                  ),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                initialIndex == 0
                                    ? Row(children: [
                                        Text('Don\'t have an account?'),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        TextButton(
                                          child: Text('Sign Up'),
                                          onPressed: () {
                                            setState(() {
                                              initialIndex = 1;
                                            });
                                          },
                                        )
                                      ])
                                    : Row(
                                        children: [
                                          Text('Already have an account?'),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  initialIndex = 0;
                                                });
                                              },
                                              child: Text('Sign In')),
                                        ],
                                      )
                              ],
                            ),
                          ),
                        ),
                        width: Get.width,
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
                height: Get.height * 0.5,
                width: Get.width,
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
                  bottom: 140.0,
                  left: 50.0,
                  right: 50.0,
                  child: initialIndex == 0
                      ? Stack(
                          children: [
                            Container(
                              height: Get.height * 0.5,
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
                                      height: 20.0,
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text('Forgot PassWord?'))),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          Get.to(() => DrawerView());
                                        },
                                        child: Text('Sign In')),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    /*TextButton(
                                        onPressed: () {
                                          setState(() {
                                            initialIndex = 1;
                                          });
                                          //Get.to(() => SignUp());
                                        },
                                        child: Text('Sign Up'))*/
                                  ],
                                ),
                              ),
                            ),
                            /* Positioned(
                            bottom: -9.0,
                            left: 50.0,
                            right: 50.0,
                            child:  ElevatedButton(
                              onPressed: () {
                                Get.to(() => DrawerView());
                              },
                              child: Text('Sign In')),)*/
                          ],
                        )
                      : Container(
                          height: Get.height * 0.5,
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
                                /*TextButton(
                                    onPressed: () {
                                      setState(() {
                                        initialIndex = 0;
                                      });
                                    },
                                    child: Text('Sign In'))*/
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
