import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wanagama_app/pages/auth_page.dart';
import 'package:wanagama_app/pages/detail_page.dart';
import 'package:wanagama_app/pages/home_page.dart';
import 'package:wanagama_app/pages/regist_page.dart';
import 'package:wanagama_app/theme/color.dart';
import 'firebase_options.dart';
import 'pages/login_page.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
   return MaterialApp(
    
    debugShowCheckedModeBanner: false,
    home: AuthPage(),
   ); 
  }
}