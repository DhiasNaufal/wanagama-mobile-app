import "package:flutter/material.dart";
import 'package:wanagama_app/theme/color.dart';

class MyButton extends StatelessWidget {

  final Function()? onTap;
  final String textButton;

  const MyButton({super.key, required this.onTap, required this.textButton});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 19, 85, 68),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text(
            textButton,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontFamily: 'Bellota'
              ),
            ), 
          ),
      ),
    );
  }
}