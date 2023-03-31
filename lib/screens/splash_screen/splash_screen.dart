import 'dart:async';

import 'package:flutter/material.dart';
import 'package:python_system/constants.dart';
import 'package:python_system/screens/welcome_screen.dart';
import 'package:python_system/widgets/navigate_to_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _goNext();
  }

  _goNext() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    navigateTo(page: const WelcomeScreen(), withHistory: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(
              height: 250,
            ),
            SizedBox(
              height: 250,
              width: 250,
              child: Image(
                image: AssetImage("assets/logo.png"),
                fit: BoxFit.fill,
              ),
            ),
            Spacer(),
            Text(
              'Medical System',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
