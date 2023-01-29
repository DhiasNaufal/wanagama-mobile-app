import 'package:flutter/material.dart';
import 'package:wanagama_app/pages/login_page.dart';
import 'package:wanagama_app/pages/regist_page.dart';

class LoginOrRegisterState extends StatefulWidget {
  const LoginOrRegisterState({super.key});

  @override
  State<LoginOrRegisterState> createState() => LoginOrRegisterStateState();
}

class LoginOrRegisterStateState extends State<LoginOrRegisterState> {
  // Show login page
  bool showLoginPage = true;

  //toggle antara login dan register

  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(
        onTap: togglePages,
      );
    } else{
      return RegistrationPage(
        onTap: togglePages,
      );
    }
    return Container();
  }
}