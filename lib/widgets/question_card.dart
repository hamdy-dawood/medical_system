import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:python_system/constants.dart';
import 'package:python_system/controllers/questions_controller.dart';
import 'package:python_system/models/question_model.dart';

import 'answer_option.dart';

class QuestionCard extends StatelessWidget {
  final QuestionModel questionModel;

  const QuestionCard({
    Key? key,
    required this.questionModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          height: 550,
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: kSecColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  questionModel.question,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 30),
                ...List.generate(
                  questionModel.options.length,
                  (index) => Column(
                    children: [
                      AnswerOption(
                          questionId: questionModel.id,
                          text: questionModel.options[index],
                          index: index,
                          onPressed: () => Get.find<QuestionsController>()
                              .checkAnswer(questionModel, index)),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          )),
    );
  }
}
