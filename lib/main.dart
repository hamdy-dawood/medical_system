import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:python_system/screens/questions_screen/questions_screen.dart';
import 'package:python_system/screens/result_screen/result_screen.dart';
import 'package:python_system/screens/welcome_screen.dart';
import 'package:python_system/util/bindings_app.dart';

import 'screens/splash_screen/splash_screen.dart';
import 'widgets/navigate_to_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsApp(),
      navigatorKey: navigatorKey,
      title: 'Medical System',
      theme: ThemeData(
        platform: TargetPlatform.iOS,
      ),
      home: const SplashScreen(),
      getPages: [
        GetPage(
            name: WelcomeScreen.routeName, page: () => const WelcomeScreen()),
        GetPage(
            name: QuestionsScreen.routeName,
            page: () => const QuestionsScreen()),
        GetPage(name: ResultScreen.routeName, page: () => const ResultScreen()),
      ],
    );
  }
}
