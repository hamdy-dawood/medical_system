import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final double height, width, radius;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.height = 150,
    this.width = 150,
    this.radius = 150,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: FloatingActionButton.extended(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        onPressed: onPressed,
        label: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.black),
        ),
      ),
    );
  }
}

class CustomElevated extends StatelessWidget {
  final String text;
  final Color textColor, btnColor;
  final double hSize, wSize, fontSize, borderRadius, elevation;
  final Function() press;

  const CustomElevated({
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
        style: TextStyle(color: textColor, fontSize: fontSize),
      ),
    );
  }
}
