import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:popapp/page2.dart';

class homepage extends StatelessWidget {
  homepage({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController pasward = TextEditingController();
  void login() async {
    String savedemail = email.text.trim();
    String savedpasward = pasward.text.trim();
    if (savedemail == "" || savedpasward == "") {
      print("wrong pasward");
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: savedemail, password: savedpasward);

        print("saved");
      } on FirebaseAuthException catch (ex) {
        print(ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("welcome")),
      body: Container(
        color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: email,
            ),
            TextField(
              keyboardType: TextInputType.name,
              controller: pasward,
            ),
            ElevatedButton(
                onPressed: () {
                  login();
                },
                child: Text("LOGIN"))
          ],
        ),
      ),
    );
  }
}
