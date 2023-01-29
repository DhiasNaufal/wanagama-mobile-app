import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wanagama_app/pages/home_page.dart';
import 'package:wanagama_app/pages/login_or_register.dart';
import 'package:wanagama_app/pages/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if(snapshot.hasData){
            return MyHomePage();
          }
          // user is NOT log in
          else{
            return LoginOrRegisterState();
          }
        }),
      );
  }
}