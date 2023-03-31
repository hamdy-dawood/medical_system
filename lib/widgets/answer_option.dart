import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:python_system/controllers/questions_controller.dart';

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
                    Border.all(width: 2, color: controller.getColor(index))),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: RichText(
                text: TextSpan(
                    text: '${index + 1}.  ',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: text,
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ]),
              ),
            ),
          )),
    );
  }
}
