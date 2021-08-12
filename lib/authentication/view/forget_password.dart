import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/authentication/controller/auth_controller.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _userEmail = TextEditingController();

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.5,
      width: Get.width * 0.8,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 30.0),
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
              height: 40.0,
            ),
            ElevatedButton(
                onPressed: () {
                  authController.sendPassWordResetEmil(email: _userEmail.text);
                },
                child: Text('Reset Password')),
          ],
        ),
      ),
    );
  }
}
