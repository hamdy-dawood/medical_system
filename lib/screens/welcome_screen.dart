import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:python_system/controllers/questions_controller.dart';
import 'package:python_system/screens/questions_screen/questions_screen.dart';
import 'package:python_system/widgets/custom_button.dart';
import 'package:python_system/widgets/navigate_to_page.dart';
import 'package:python_system/widgets/outlined_button.dart';

import '../constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const routeName = '/welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _nameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  void _submit(context) {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    Get.offAndToNamed(QuestionsScreen.routeName);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kWhiteColor,
      extendBody: true,
      drawer: GetBuilder<QuestionsController>(
          init: QuestionsController(),
        builder: (controller) {
          return Drawer(
            backgroundColor: Colors.white,
            child: ListView(
              children: [
                SizedBox(
                  height: 250,
                  child: DrawerHeader(
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      image: DecorationImage(
                        image: ExactAssetImage("assets/images/sec_logo.jpg"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: AnimatedTextKit(
                        totalRepeatCount: 1,
                        animatedTexts: [
                          TyperAnimatedText(
                            'AI Physio',
                            textStyle: GoogleFonts.cairo(
                              textStyle: const TextStyle(
                                color: kWhiteColor,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 4,
                              ),
                            ),
                            speed: const Duration(milliseconds: 100),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0))),
                        contentPadding: const EdgeInsets.all(20),
                        content: SizedBox(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'language'.tr,
                                style: GoogleFonts.cairo(
                                  textStyle: const TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CustomOutlinedButton(
                                press: () {
                                  Get.updateLocale(const Locale('en', 'US'));
                                  navigateTo(page: const WelcomeScreen());
                                  controller.isArabic = false;
                                },
                                text: "English",
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomOutlinedButton(
                                press: () {
                                  Get.updateLocale(const Locale('fr', 'PA'));
                                  navigateTo(page: const WelcomeScreen());
                                  controller.isArabic = false;
                                },
                                text: "French",
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomOutlinedButton(
                                press: () {
                                  Get.updateLocale(const Locale('ar', 'EG'));
                                  navigateTo(page: const WelcomeScreen());
                                  controller.isArabic = true;
                                },
                                text: "اللغة العربية",
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  leading: const Icon(
                    Icons.language_outlined,
                    size: 30,
                    color: kPrimaryColor,
                  ),
                  title: Text(
                    "language".tr,
                    style: GoogleFonts.cairo(
                      textStyle: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                'hello'.tr,
                style: GoogleFonts.cairo(
                  textStyle: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Text(
                "let's_start".tr,
                style: GoogleFonts.cairo(
                  textStyle: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80, right: 100),
                child: Text(
                  "questions".tr,
                  style: GoogleFonts.cairo(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Form(
                key: _formKey,
                child: GetBuilder<QuestionsController>(
                  init: Get.find<QuestionsController>(),
                  builder: (controller) => TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'full_name'.tr,
                      hintStyle: GoogleFonts.cairo(
                        textStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                      labelText: 'full_name'.tr,
                      labelStyle: GoogleFonts.cairo(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        borderSide: BorderSide(
                          color: kPrimaryColor,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        borderSide: BorderSide(
                          color: kPrimaryColor,
                        ),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        borderSide: BorderSide(color: Colors.red, width: 2.0),
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        borderSide: BorderSide(color: Colors.red, width: 2.0),
                      ),
                    ),
                    validator: (String? val) {
                      if (val!.isEmpty) {
                        return "empty_name".tr;
                      } else {
                        return null;
                      }
                    },
                    onSaved: (String? val) {
                      controller.name = val!.trim().toUpperCase();
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                  press: () => _submit(context),
                  btnColor: kPrimaryColor,
                  text: "start".tr,
                  textColor: kWhiteColor,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
