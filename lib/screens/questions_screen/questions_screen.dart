import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:python_system/constants.dart';
import 'package:python_system/controllers/questions_controller.dart';
import 'package:python_system/widgets/custom_button.dart';
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
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Question ',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(color: kPrimaryColor),
                                children: [
                                  TextSpan(
                                      text: controller.numberOfQuestion
                                          .round()
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(color: Colors.black)),
                                  TextSpan(
                                      text: '/',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(color: Colors.black)),
                                  TextSpan(
                                      text:
                                          controller.countOfQuestion.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(color: Colors.black)),
                                ]),
                          ),
                        ],
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
        builder: (controller) => CustomElevated(
          press: () => controller.nextQuestion(),
          btnColor: kPrimaryColor,
          text: 'Next',
          fontSize: 22,
          wSize: 150,
        ),
      ),
    );
  }
}
