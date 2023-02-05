import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailText extends StatelessWidget {
  final String field;
  final String value;
  const DetailText({super.key, required this.field, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Expanded(
              flex: 6,
              child: Text(
                field,
                style: GoogleFonts.poppins(fontSize: 15),
              )),
          Expanded(
              flex: 1,
              child: Text(
                ':',
                style: GoogleFonts.poppins(fontSize: 14),
              )),
          Expanded(
              flex: 9,
              child: Text(
                value,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                ),
              ))
        ],
      ),
    );
  }
}
