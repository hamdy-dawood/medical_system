import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor, btnColor;
  final double hSize, wSize, fontSize, borderRadius, elevation;
  final Function() press;

  const CustomButton({
    Key? key,
    required this.text,
    required this.press,
    this.textColor = Colors.white,
    required this.btnColor,
    this.hSize = 50,
    this.wSize = 400,
    this.elevation = 2.5,
    this.fontSize = 22,
    this.borderRadius = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
        backgroundColor: btnColor,
        elevation: elevation,
        shadowColor: kPrimaryColor,
        fixedSize: Size(wSize, hSize),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.cairo(
          textStyle: TextStyle(
            color: textColor,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
