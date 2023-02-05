import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wanagama_app/components/my_button.dart';
import 'package:wanagama_app/components/my_textfield.dart';
import 'package:wanagama_app/components/square_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();


  void SignUserIn()async{
    // loading
    showDialog(
    context: context,
    builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e){
      if(e.code == 'user-not-found'){
        Navigator.pop(context);
        WrongEmailMessage();
        print('no user found for that email');
      }else if (e.code == 'wrong-password'){
        Navigator.pop(context);
        WrongPasswordMessage();
        print('wrng password');
      }
    }
  }

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
  }

  void WrongEmailMessage(){
    showDialog(
      context: context, 
      builder: (context){
        return const AlertDialog(
          title: Text('Email Tidak Terdaftar'),
        );
      },
    );
  }
  void WrongPasswordMessage(){
    showDialog(
      context: context, 
      builder: (context){
        return const AlertDialog(
          title: Text('Password Salah'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      //resizeToAvoidBottomInset : false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
              SizedBox(height: 20),
              // Logo
              Image.asset(
                'lib/assets/images/logo_wanagama_1.png',
                height: 220,
                ),
              SizedBox(height: 20),
              // Selamat Datang Di Wanagama
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Selamat Datang di ',
                    style: GoogleFonts.poppins(
                      fontSize: 16
                    ),
                    ),
                    Text(
                      'wanagama',
                    style: TextStyle(
                      fontFamily: "Bellota",
                      fontWeight: FontWeight.bold,
                      fontSize: 18 
                    ),
                    ),
                ],
              ),
              
              SizedBox(height: 10,),
              // Username Field
              MyTextField(
                controller: emailController,
                hintText: 'Username', 
                obscureText: false, fieldIcon: Icons.person,
                fieldAction: TextInputAction.next,
                ),
          
              SizedBox(height: 10,),
          
              MyTextField(
          
                controller: passwordController,
                hintText: 'Password',
                obscureText: true, fieldIcon: Icons.key,
                fieldAction: TextInputAction.done,
              ),
                
              // forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25.0, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Lupa Password?",
                      style: GoogleFonts.poppins(),),
                  ],
                ),
              ),
          
              SizedBox(height: 20,),
              // Masuk Button
          
              MyButton(
                onTap: SignUserIn, textButton: 'masuk',
                ),
              // Belum memiliki Akun          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Belum memiliki akun?", style: GoogleFonts.poppins(),),
                  SizedBox(width: 5,),
                  GestureDetector(
                    onTap: widget.onTap ,
                    child: Text(
                      "Daftar Disini",
                      style: TextStyle(color: Colors.green),),
                  )
                ],
              ),
              SizedBox(height: 20,),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                    ),
          
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0),
                      child: Text("Or Continue with", style: GoogleFonts.poppins(),),
                    ),
          
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
          
              SizedBox(height: 10,),
              // Alternative Sign In
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                      imagePath: "lib/assets/images/google_logo.png"
                      ),
          
                    SizedBox(width: 10,),
          
                    SquareTile(
                      imagePath: "lib/assets/images/facebook_logo.png"
                      ),
                  ],
                ),
              ),
          
          
            ],),
          ),
        ),
      ),
    );
  }
}