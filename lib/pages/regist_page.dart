import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wanagama_app/components/my_button.dart';
import 'package:wanagama_app/components/my_textfield.dart';
import 'package:wanagama_app/components/square_tile.dart';

class RegistrationPage extends StatefulWidget {
  void Function()? onTap;
  RegistrationPage({super.key, required this.onTap});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final usernameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmpassewordController = TextEditingController();

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
      if(usernameController.text == null)
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
                  obscureText: false, 
                  fieldIcon: Icons.lock,
                  fieldAction: TextInputAction.next,                
                ),
              
                SizedBox(height: 10,),
              
                // Konfirmasi Password
                MyTextField(
                  controller:confirmpassewordController, 
                  hintText: 'Konfirmasi Password', 
                  obscureText: false, 
                  fieldIcon: Icons.key,
                  fieldAction: TextInputAction.done,                
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