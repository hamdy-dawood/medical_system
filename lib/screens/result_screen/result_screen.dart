import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:python_system/controllers/questions_controller.dart';
import 'package:python_system/widgets/custom_button.dart';
import 'package:python_system/widgets/result_card.dart';

import '../../constants.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);
  static const routeName = '/result_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                GetBuilder<QuestionsController>(
                  init: Get.find<QuestionsController>(),
                  builder: (controller) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Hello ',
                          style: const TextStyle(
                            fontSize: 30,
                            color: kPrimaryColor,
                          ),
                          children: [
                            TextSpan(
                              text: controller.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    color: kPrimaryColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      if (controller.bruiseResult >
                              controller.muscleContractionResult &&
                          controller.bruiseResult > controller.myositisResult &&
                          controller.bruiseResult >
                              controller.muscleStrainResult &&
                          controller.bruiseResult >
                              controller.tighteningOfMuscleResult &&
                          controller.bruiseResult >
                              controller.partialRuptureResult &&
                          controller.bruiseResult >
                              controller.totalRuptureResult &&
                          controller.bruiseResult >= 5) ...[
                        const ResultCard(
                          title: "Bruise:",
                          subTitle:
                              " Rest time before starting the treatment: Take a rest from 24 hours to 48 hours. Duration of the treatment : 1 day to 10 days.",
                          image1: "assets/bruises1.png",
                          image2: "assets/bruises2.png",
                        ),
                      ]else if(controller.muscleContractionResult >
                          controller.bruiseResult &&
                          controller.muscleContractionResult >
                              controller.myositisResult &&
                          controller.muscleContractionResult >
                              controller.muscleStrainResult &&
                          controller.muscleContractionResult >
                              controller.tighteningOfMuscleResult &&
                          controller.muscleContractionResult >
                              controller.partialRuptureResult &&
                          controller.muscleContractionResult >
                              controller.totalRuptureResult &&
                          controller.muscleContractionResult >= 5) ...[
                        const ResultCard(
                          title: "Muscle contraction:",
                          subTitle:
                          " Rest time before starting the treatment:Take a rest from 1 day to 3 days.Duration of the treatment : 1 week.",
                          image1: "assets/muscle_contraction.png",
                        ),
                      ]else if(controller.myositisResult > controller.bruiseResult &&
                          controller.myositisResult >
                              controller.muscleContractionResult &&
                          controller.myositisResult >
                              controller.muscleStrainResult &&
                          controller.myositisResult >
                              controller.tighteningOfMuscleResult &&
                          controller.myositisResult >
                              controller.partialRuptureResult &&
                          controller.myositisResult >
                              controller.totalRuptureResult &&
                          controller.myositisResult >= 5) ...[
                        const ResultCard(
                          title: "Myositis:",
                          subTitle:
                          " Rest time before starting the treatment:Take a rest from 2 days to 4 days.Duration of the treatment : from 1 week to 3 weeks.",
                          image1: "assets/myositis.png",
                        ),
                      ]else if(controller.muscleStrainResult >
                          controller.bruiseResult &&
                          controller.muscleStrainResult >
                              controller.muscleContractionResult &&
                          controller.muscleStrainResult >
                              controller.myositisResult &&
                          controller.muscleStrainResult >
                              controller.tighteningOfMuscleResult &&
                          controller.muscleStrainResult >
                              controller.partialRuptureResult &&
                          controller.muscleStrainResult >
                              controller.totalRuptureResult &&
                          controller.muscleStrainResult >= 4) ...[
                        const ResultCard(
                          title: "Muscle Strain:",
                          subTitle:
                          " Rest time before starting the treatment: Take a rest from 2 days to 4 days. Duration of the treatment : from 1 day to 10 days.",
                          image1: "assets/muscle_strain.png",
                        ),
                      ]else if(controller.tighteningOfMuscleResult >
                          controller.bruiseResult &&
                          controller.tighteningOfMuscleResult >
                              controller.muscleContractionResult &&
                          controller.tighteningOfMuscleResult >
                              controller.myositisResult &&
                          controller.tighteningOfMuscleResult >
                              controller.muscleStrainResult &&
                          controller.tighteningOfMuscleResult >
                              controller.partialRuptureResult &&
                          controller.tighteningOfMuscleResult >
                              controller.totalRuptureResult &&
                          controller.tighteningOfMuscleResult >= 4) ...[
                        const ResultCard(
                          title: "Tightening Of Muscle:",
                          subTitle:
                          " Rest time before starting the treatment: Take a rest from 2 days to 4 days. Duration of the treatment : from 10 days to 20 days.",
                          image1: "assets/tightening_muscle.png",
                        ),
                      ]else if(controller.partialRuptureResult >
                          controller.bruiseResult &&
                          controller.partialRuptureResult >
                              controller.muscleContractionResult &&
                          controller.partialRuptureResult >
                              controller.myositisResult &&
                          controller.partialRuptureResult >
                              controller.muscleStrainResult &&
                          controller.partialRuptureResult >
                              controller.tighteningOfMuscleResult &&
                          controller.partialRuptureResult >
                              controller.totalRuptureResult &&
                          controller.partialRuptureResult >= 7) ...[
                        const ResultCard(
                          title: "Partial Rupture:",
                          subTitle:
                          " Rest time before starting the treatment: Take a rest from 3 days to 6 days. Duration of the treatment : from 3 weeks to 7 weeks.",
                          image1: "assets/partial _rupture.png",
                        ),
                      ]else if(controller.totalRuptureResult >
                          controller.bruiseResult &&
                          controller.totalRuptureResult >
                              controller.muscleContractionResult &&
                          controller.totalRuptureResult >
                              controller.myositisResult &&
                          controller.totalRuptureResult >
                              controller.muscleStrainResult &&
                          controller.totalRuptureResult >
                              controller.tighteningOfMuscleResult &&
                          controller.totalRuptureResult >
                              controller.partialRuptureResult &&
                          controller.totalRuptureResult > 4) ...[
                        const ResultCard(
                          title: "Total Rupture:",
                          subTitle:
                          " Rest time before starting the treatment: According to the opinion of the doctor and after surgery if needed. Duration of the treatment : from 5 weeks to 12 weeks.",
                          image1: "assets/total_rupture.png",
                        ),
                      ]else...[
                        const ResultCard(
                          title: "Error:",
                          subTitle:
                          " We found a problem that contradicts your answers or didn't answer them, Please try again.",
                          image1: "assets/space.png",
                        ),
                      ],
                      const SizedBox(
                        height: 30,
                      ),
                      CustomElevated(
                        press: () => controller.startAgain(),
                        btnColor: kPrimaryColor,
                        text: 'Start Again',
                        fontSize: 22,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
