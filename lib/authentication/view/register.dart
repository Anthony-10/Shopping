import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/authentication/controller/auth_controller.dart';
import 'package:shopping_app/core/service/data_base_service.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _userEmail = TextEditingController();
  final TextEditingController _userPassWord = TextEditingController();

  final authController = Get.find<AuthController>();
  final DatabaseService databaseService = Get.put(DatabaseService());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.5,
      width: Get.width * 0.8,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                key: const ValueKey("UserName"),
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: "Name",
                ),
                controller: _userName,
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                key: const ValueKey("UserEmail"),
                textAlign: TextAlign.start,
                keyboardType: TextInputType.emailAddress,
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
                key: const ValueKey("UserPassword"),
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: "PassWord",
                ),
                controller: _userPassWord,
              ),
              SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    getData();
                    authController.createUser(
                        firstName: _userName.text,
                        email: _userEmail.text,
                        password: _userPassWord.text);
                  },
                  child: Text('Sign up')),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getData() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('DefaultPhoto')
          .doc('Yl6gJHGOMNblFLE4WhAp')
          .get();
      if (documentSnapshot.exists) {
        setState(() {
          authController.defaulImage = documentSnapshot.get('DefUrl');
        });
      } else {
        print('wewe');
      }
    } catch (e) {
      print(e);
    }
  }
}
