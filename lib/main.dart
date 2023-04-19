import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:python_system/constants.dart';
import 'package:python_system/screens/questions_screen/questions_screen.dart';
import 'package:python_system/screens/result_screen/result_screen.dart';
import 'package:python_system/screens/welcome_screen.dart';
import 'package:python_system/util/bindings_app.dart';

import 'languages.dart';
import 'screens/splash_screen/splash_screen.dart';
import 'widgets/navigate_to_page.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: kPrimaryColor,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI Physio',
      translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      initialBinding: BindingsApp(),
      navigatorKey: navigatorKey,
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
