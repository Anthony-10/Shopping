import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shopping_app/authentication/controller/auth_controller.dart';
import 'package:shopping_app/authentication/view/register.dart';
import 'forget_password.dart';
import 'login.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key key}) : super(key: key);

  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  //int initialIndex = 0;

  //final authController = Get.find<AuthController>();
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
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
                      child: authController.initialIndexAuth == 0
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
                                ),
                              ),
                            )
                          : authController.initialIndexAuth == 1
                              ? Align(
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
                                )
                              //TODO
                              : Align(
                                  alignment: Alignment(-0.5, -0.1),
                                  child: DefaultTextStyle(
                                    style: TextStyle(
                                        fontSize: 35.0, color: Colors.white),
                                    child: Text(
                                      'Forget'
                                      '\nPassword',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 35.0),
                                    ),
                                  ),
                                )),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 90, top: 230),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                authController.initialIndexAuth == 0
                                    ? Row(children: [
                                        Text('Don\'t have an account?'),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        TextButton(
                                          child: Text('Sign Up'),
                                          onPressed: () {
                                            setState(() {
                                              authController.initialIndexAuth =
                                                  1;
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
                                                  authController
                                                      .initialIndexAuth = 0;
                                                });
                                              },
                                              child: Text('Sign In')),
                                        ],
                                      )
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.mail,
                                    size: 30.0,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {},
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.facebook,
                                    size: 30.0,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
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
                child: authController.initialIndexAuth == 0
                    ? Login()
                    : authController.initialIndexAuth == 1
                        ? Register()
                        : ForgetPassword())
          ],
        ),
      ),
    );
  }
}
