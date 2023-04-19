import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final double hSize, wSize, fontSize, borderRadius;
  final Function() press;

  const CustomOutlinedButton({
    Key? key,
    required this.text,
    required this.press,
    this.textColor = Colors.black,
    this.hSize = 55,
    this.wSize = 400,
    this.fontSize = 22,
    this.borderRadius = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      splashColor: Colors.white,
      highlightColor: kThirdColor,
      child: Container(
        height: hSize,
        width: wSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            width: 2,
            color: kPrimaryColor,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.cairo(
              textStyle: TextStyle(
                color: textColor,
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
