import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:python_system/constants.dart';
import 'package:python_system/controllers/questions_controller.dart';
import 'package:python_system/core/to_arabic_number_convertor.dart';
import 'package:python_system/widgets/custom_button.dart';
import 'package:python_system/widgets/navigate_to_page.dart';
import 'package:python_system/widgets/outlined_button.dart';
import 'package:python_system/widgets/question_card.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({Key? key}) : super(key: key);
  static const routeName = '/questions_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SafeArea(
            child: GetBuilder<QuestionsController>(
              init: QuestionsController(),
              builder: (controller) => SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        color: kPrimaryColor,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 20.0,
                            left: 20.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                    text: "question".tr,
                                    style: GoogleFonts.cairo(
                                      textStyle: const TextStyle(
                                        color: kWhiteColor,
                                        fontSize: 40,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: controller.isArabic
                                            ? controller.numberOfQuestion
                                                .round()
                                                .toString()
                                                .toArabicNumbers
                                            : controller.numberOfQuestion
                                                .round()
                                                .toString(),
                                        style: GoogleFonts.cairo(
                                          textStyle: const TextStyle(
                                            color: kWhiteColor,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                        text: "/".tr,
                                        style: GoogleFonts.cairo(
                                          textStyle: const TextStyle(
                                            color: kWhiteColor,
                                            fontSize: 25,
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                        text: controller.isArabic
                                            ? controller.countOfQuestion
                                                .toString()
                                                .toArabicNumbers
                                            : controller.countOfQuestion
                                                .toString(),
                                        style: GoogleFonts.cairo(
                                          textStyle: const TextStyle(
                                            color: kWhiteColor,
                                            fontSize: 28,
                                            fontWeight: FontWeight.w200,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                              IconButton(
                                onPressed: () {
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
                                                controller.isArabic = false;
                                                Navigator.pop(context);
                                              },
                                              text: "English",
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CustomOutlinedButton(
                                              press: () {
                                                Get.updateLocale(const Locale('fr', 'PA'));
                                                controller.isArabic = false;
                                                Navigator.pop(context);
                                              },
                                              text: "French",
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CustomOutlinedButton(
                                              press: () {
                                                Get.updateLocale(const Locale('ar', 'EG'));
                                                controller.isArabic = true;
                                                Navigator.pop(context);
                                              },
                                              text: "اللغة العربية",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.language_outlined,
                                  size: 35,
                                  color: kWhiteColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 550,
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => QuestionCard(
                          questionModel: controller.questionsList[index],
                        ),
                        controller: controller.pageController,
                        itemCount: controller.questionsList.length,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: GetBuilder<QuestionsController>(
        init: QuestionsController(),
        builder: (controller) => CustomButton(
          press: () => controller.nextQuestion(),
          btnColor: kPrimaryColor,
          text: "next".tr,
          fontSize: 25,
          wSize: 150,
        ),
      ),
    );
  }
}
