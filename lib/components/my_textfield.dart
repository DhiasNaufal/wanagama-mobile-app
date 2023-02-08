import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final IconData fieldIcon;
  final fieldAction;
  final keyboardType;
  final suffix;

  const MyTextField({
    super.key, 
    required this.controller,
    required this.hintText, 
    required this.obscureText, 
    required this.fieldIcon, 
    this.fieldAction, this.keyboardType, this.suffix
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        keyboardType: keyboardType,
        style: GoogleFonts.poppins(),
        textInputAction: fieldAction,
        controller: controller,
        obscureText: obscureText,   
        decoration: InputDecoration(
          suffixIcon: suffix,
          prefixIcon: Icon(fieldIcon),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color.fromARGB(255, 130, 130, 130)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 19, 85, 68))
            ),
            fillColor: Color.fromARGB(255, 255, 255, 255),
            filled: true,
            hintText: hintText,
            
        ),
      ),
    );
  }
}