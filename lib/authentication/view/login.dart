import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/authentication/controller/auth_controller.dart';
import 'package:shopping_app/authentication/view/forget_password.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _userEmail = TextEditingController();
  final TextEditingController _userPassWord = TextEditingController();

  final authController = Get.find<AuthController>();

  int initialindexPage = 0;
  @override
  Widget build(BuildContext context) {
    return initialindexPage == 0
        ? Container(
            height: Get.height * 0.5,
            width: Get.width * 0.8,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 30.0),
              child: Column(
                children: [
                  TextFormField(
                    key: const ValueKey("UserEmail"),
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: "Email",
                    ),
                    controller: _userEmail,
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
                    controller: _userPassWord,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          initialindexPage = 1;
                          authController.initialIndexAuth = 2;
                        });
                        print(authController.initialIndexAuth);
                      },
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Text('Forgot PassWord?'))),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        authController.logIn(
                            email: _userEmail.text,
                            password: _userPassWord.text);
                      },
                      child: Text('Sign In')),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          )
        : ForgetPassword();
  }
}
