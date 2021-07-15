import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/authentication/controller/auth_controller.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({Key key}) : super(key: key);

  @override
  _DeleteAccountState createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  final TextEditingController _userEmail = TextEditingController();
  final TextEditingController _userPassWord = TextEditingController();

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
                onPressed: () {
                  authController.logIn(
                      email: _userEmail.text, password: _userPassWord.text);
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
    );
  }
}
