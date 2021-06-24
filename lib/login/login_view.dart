import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  //const LoginView({Key key}) : super(key: key);

  final TextEditingController _UserName = TextEditingController();
  final TextEditingController _UserPassWord = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "assets/login.jpeg",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
                top: 80.0,
                left: 120.0,
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white, fontSize: 35.0),
                )),
            Positioned(
              bottom: 70.0,
              left: 50.0,
              right: 50.0,
              child: Container(
                height: Get.height * 0.6,
                width: Get.width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 30.0),
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
                      ElevatedButton(onPressed: () {}, child: Text('Sign In')),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextButton(onPressed: () {}, child: Text('Sign Up'))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
