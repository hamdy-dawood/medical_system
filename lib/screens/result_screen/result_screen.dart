import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
                        height: 70,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'hello'.tr,
                          style: GoogleFonts.cairo(
                            textStyle: const TextStyle(
                              fontSize: 30,
                              color: kPrimaryColor,
                            ),
                          ),
                          children: [
                            TextSpan(
                              text: controller.name,
                              style: GoogleFonts.cairo(
                                textStyle: const TextStyle(
                                  fontSize: 40,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (controller.bruiseResult > controller.muscleContractionResult &&
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
                        ResultCard(
                          title: "bruise".tr,
                          symptoms: 4,
                          symptom1: "bruise_symptom1".tr,
                          symptom2: "bruise_symptom2".tr,
                          symptom3: "bruise_symptom3".tr,
                          symptom4: "bruise_symptom4".tr,
                          treatment: "desc_bruise".tr,
                          image1: "assets/images/bruises1.png",
                          image2: "assets/images/bruises2.png",
                        ),
                      ] else if (controller.muscleContractionResult >
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
                        ResultCard(
                          title: "muscle_contraction".tr,
                          symptoms: 2,
                          symptom1: "muscle_contraction_symptom1".tr,
                          symptom2: "muscle_contraction_symptom2".tr,
                          treatment: "desc_muscle_contraction".tr,
                          image1: "assets/images/muscle_contraction.png",
                        ),
                      ] else if (controller.myositisResult > controller.bruiseResult &&
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
                        ResultCard(
                          title: "myositis",
                          symptoms: 2,
                          symptom1: "myositis_symptom1".tr,
                          symptom2: "myositis_symptom2".tr,
                          treatment: "desc_myositis".tr,
                          image1: "assets/images/myositis.png",
                        ),
                      ] else if (controller.muscleStrainResult > controller.bruiseResult &&
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
                        ResultCard(
                          title: "muscle_strain".tr,
                          symptoms: 3,
                          symptom1: "muscle_strain_symptom1".tr,
                          symptom2: "muscle_strain_symptom2".tr,
                          symptom3: "muscle_strain_symptom3".tr,
                          treatment: "desc_muscle_strain".tr,
                          image1: "assets/images/muscle_strain.png",
                        ),
                      ] else if (controller.tighteningOfMuscleResult >
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
                        ResultCard(
                          title: "tightening_of_muscle".tr,
                          symptoms: 2,
                          symptom1: "tightening_of_muscle_symptom1".tr,
                          symptom2: "tightening_of_muscle_symptom2".tr,
                          treatment: "desc_tightening_of_muscle".tr,
                          image1: "assets/images/tightening_muscle.png",
                        ),
                      ] else if (controller.partialRuptureResult > controller.bruiseResult &&
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
                        ResultCard(
                          title: "partial_rupture".tr,
                          symptoms: 1,
                          symptom1: "partial_rupture_symptom1".tr,
                          treatment: "desc_partial_rupture".tr,
                          image1: "assets/images/partial _rupture.png",
                        ),
                      ] else if (controller.totalRuptureResult > controller.bruiseResult &&
                          controller.totalRuptureResult > controller.muscleContractionResult &&
                          controller.totalRuptureResult > controller.myositisResult &&
                          controller.totalRuptureResult > controller.muscleStrainResult &&
                          controller.totalRuptureResult > controller.tighteningOfMuscleResult &&
                          controller.totalRuptureResult > controller.partialRuptureResult &&
                          controller.totalRuptureResult > 4) ...[
                        ResultCard(
                          title: "total_rupture".tr,
                          symptoms: 1,
                          symptom1: "total_rupture_symptom1".tr,
                          treatment: "desc_total_rupture".tr,
                          image1: "assets/images/total_rupture.png",
                        ),
                      ] else ...[
                        ErrorCard(
                          title: "error".tr,
                          subTitle: "desc_error".tr,
                        ),
                      ],
                      const SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                        press: () => controller.startAgain(),
                        btnColor: kPrimaryColor,
                        text: 'start_again'.tr,
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
