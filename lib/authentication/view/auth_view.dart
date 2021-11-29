import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
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
  final authController = Get.put(AuthController());
  final heights = Get.height;
  final widths = Get.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
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
                  Container(
                      height: heights * 0.4,
                      width: widths,
                      child: authController.initialIndexAuth == 0
                          ? Padding(
                              padding: EdgeInsets.only(
                                  top: heights * .1,
                                  left: widths * .1,
                                  right: widths * .1),
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
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      top: heights * .09,
                                      left: widths * .1,
                                      right: widths * .1),
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
                              : Padding(
                                  padding: EdgeInsets.only(
                                      top: heights * .09,
                                      left: widths * .1,
                                      right: widths * .1),
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
                        padding: EdgeInsets.only(
                            left: widths * .2, top: heights * .4),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                authController.initialIndexAuth == 0
                                    ? Row(children: [
                                        Text("Don't have an account?"),
                                        SizedBox(
                                          width: widths * .02,
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
                                            width: widths * .02,
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
                              height: Get.height * .02,
                            ),
                            FloatingActionButton.extended(
                              icon: Icon(
                                Icons.mail,
                                size: 30.0,
                                color: Colors.red,
                              ),
                              label: Text('Sign in with Google'),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              onPressed: () {
                                authController.googleLogin();
                              },
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
            Positioned(
                top: heights * .3,
                left: widths * .1,
                right: widths * .1,
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
