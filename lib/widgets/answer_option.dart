import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:python_system/constants.dart';
import 'package:python_system/controllers/questions_controller.dart';
import 'package:python_system/core/to_arabic_number_convertor.dart';

class AnswerOption extends StatelessWidget {
  const AnswerOption({
    Key? key,
    required this.text,
    required this.index,
    required this.questionId,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final int index;
  final int questionId;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionsController>(
      init: Get.find<QuestionsController>(),
      builder: (controller) => InkWell(
          onTap:
              controller.checkIsQuestionAnswered(questionId) ? null : onPressed,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border:
                    Border.all(width: 1, color: controller.getColor(index))),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: RichText(
                text: TextSpan(
                    text: controller.isArabic?'${index + 1}.  '.toArabicNumbers:'${index + 1}.  ',
                    style: GoogleFonts.cairo(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: kWhiteColor,
                      ),
                    ),
                    children: [
                      TextSpan(
                        text: text,
                        style: GoogleFonts.cairo(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: kWhiteColor,
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          )),
    );
  }
}
