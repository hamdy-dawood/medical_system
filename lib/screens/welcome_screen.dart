import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:python_system/controllers/questions_controller.dart';
import 'package:python_system/screens/questions_screen/questions_screen.dart';
import 'package:python_system/widgets/custom_button.dart';

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
        backgroundColor: Colors.white,
        extendBody: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 150,
                ),
                const Text(
                  'Hello',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 50,
                      fontWeight: FontWeight.w900),
                ),
                const Text(
                  'Let\'s start',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  '        Questions,',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 120,
                ),
                Form(
                  key: _formKey,
                  child: GetBuilder<QuestionsController>(
                    init: Get.find<QuestionsController>(),
                    builder: (controller) => TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        hintText: ' Full Name  ',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                        labelText: ' Full Name  ',
                        labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          borderSide: BorderSide(
                            color: kPrimaryColor,
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          borderSide: BorderSide(
                            color: kPrimaryColor,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                      ),
                      validator: (String? val) {
                        if (val!.isEmpty) {
                          return 'Name should not be empty';
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
                  child: CustomElevated(
                    press: () => _submit(context),
                    btnColor: kPrimaryColor,
                    text: 'Start',
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
