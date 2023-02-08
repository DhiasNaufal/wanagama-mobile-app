import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wanagama_app/components/my_button.dart';
import 'package:wanagama_app/components/my_textfield.dart';
import 'package:wanagama_app/components/square_tile.dart';

import '../services/auth_services.dart';

class RegistrationPage extends StatefulWidget {
  void Function()? onTap;
  RegistrationPage({super.key, required this.onTap});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _isHide = true;
  final String? uid = FirebaseAuth.instance.currentUser?.uid;
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpassewordController = TextEditingController();

  @override
  void dispose(){
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpassewordController.dispose();
    super.dispose();
  }

  void signUserUp() async{
    showDialog(
    context: context,
    builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
        );
      },
    );

    try {
      if(passwordController.text == confirmpassewordController.text){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text);
        Navigator.pop(context);
      }else{
        Navigator.pop(context);
        showErrorMesage("Password tidak sama");

      }
    } on FirebaseAuthException catch (e){
      Navigator.pop(context);
      showErrorMesage(e.code);
    }

    //user detail
    addUserDetails(
      usernameController.text.trim(),
      emailController.text.trim(),
    );
  } 
    Future addUserDetails(String userName, String email) async{
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'user name':userName,
        'email':email,
      });
    }



    void showErrorMesage(String message){
      showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            title: Center(
              child: Text(
                message)),
          );
        }
      );
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 45,),
                Image.asset(
                 'lib/assets/images/wanagama_hor.png'
                ),
                // SizedBox(height: 15,),
                Text(
                  "Daftarkan dirimu!",
                  style: TextStyle(
                    fontFamily: "Bellota",
                    fontWeight: FontWeight.bold,
                    fontSize: 20, 
                  ),
                  ),
                SizedBox(height:20,),
                // Username
                MyTextField(
                  controller: usernameController, 
                  hintText: 'Username', 
                  obscureText: false, 
                  fieldIcon: Icons.person,
                  fieldAction: TextInputAction.next,
                ),
              
                SizedBox(height: 10,),
              
                // Email              
                MyTextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController, 
                  hintText: 'Email Address', 
                  obscureText: false, 
                  fieldIcon: Icons.email,
                  fieldAction: TextInputAction.next,                
                ),
              
                SizedBox(height: 10,),            
              
                // Password
                MyTextField(
                  controller: passwordController, 
                  hintText: 'Password', 
                  obscureText: _isHide, 
                  fieldIcon: Icons.lock,
                  fieldAction: TextInputAction.next,
                  suffix: InkWell(
                  onTap: _togglePasswordView,
                  child: Icon(
                      _isHide
                      ? Icons.visibility_off
                      : Icons.visibility,
                    ),
                ),              
                ),
              
                SizedBox(height: 10,),
              
                // Konfirmasi Password
                MyTextField(
                  controller:confirmpassewordController, 
                  hintText: 'Konfirmasi Password', 
                  obscureText: _isHide, 
                  fieldIcon: Icons.key,
                  fieldAction: TextInputAction.done, 
                  suffix: InkWell(
                  onTap: _togglePasswordView,
                  child: Icon(
                      _isHide
                      ? Icons.visibility_off
                      : Icons.visibility,
                    ),
                ),                             
                ),
                SizedBox(height:40,),
              
                //Daftar Button
                MyButton(
                  onTap: signUserUp, textButton: 'daftar',
                  ),
              
                // Sudah memiliki Akun? Masuk di sini
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sudah memiliki akun?'),
                    SizedBox(width: 5,),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Masuk di sini',
                        style: TextStyle(
                          color: Colors.green
                        ),),
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
              GestureDetector(
                onTap: () => AuthService().signInWithGoogle(),
                child: Container(
                  padding: EdgeInsets.all(7),
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    color: Colors.blueGrey,
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 12,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(1),
              
                            ),
                            child: Image.asset('lib/assets/images/google_logo.png',
                            height: 40,),
                          ),
                        ),
                        Expanded(
                          flex: 85,
                          child: Center(
                            child: Text(
                              'Sign in with Google ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16  ,
                                fontWeight: FontWeight.bold
                              ),
                              ),
                          ),
                        ),
                      ],
                    )),
                ),
              ),

              ],),
          ),
        ),
      ),
    );
  }
    void _togglePasswordView() {
    setState(() {
        _isHide = !_isHide;
    });
  }
}