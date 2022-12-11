import 'package:doan/Begin.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';



class Services {
  final auth = FirebaseAuth.instance;
  loginUser(email, password, context) async {
    late String txtEmail;
    await auth.signInWithEmailAndPassword(email: email, password: password);
      if(auth.signInWithEmailAndPassword(email: email, password: password)!= null)
      {
          auth.authStateChanges().listen((event) {
        if (event != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Begin()));
        }
      });
      }
  }
}
