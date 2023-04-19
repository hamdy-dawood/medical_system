import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:python_system/constants.dart';

class ResultCard extends StatelessWidget {
  final String title, treatment, image1;
  final String? image2, symptom1, symptom2, symptom3, symptom4;
  final int symptoms;

  const ResultCard({
    Key? key,
    required this.title,
    required this.symptoms,
    this.symptom1 = '',
    this.symptom2 = '',
    this.symptom3 = '',
    this.symptom4 = '',
    required this.treatment,
    required this.image1,
    this.image2 = "assets/images/space.png",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.cairo(
              textStyle: const TextStyle(
                fontSize: 35,
                color: kWhiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(symptoms, (index) {
              return Row(
                children: [
                  const CircleAvatar(
                    radius: 5,
                    backgroundColor: kWhiteColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      index == 0
                          ? "$symptom1"
                          : index == 1
                              ? "$symptom2"
                              : index == 2
                                  ? "$symptom3"
                                  : index == 3
                                      ? "$symptom4"
                                      : '',
                      style: GoogleFonts.cairo(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: kWhiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
          Text(
            "treatment".tr,
            style: GoogleFonts.cairo(
              textStyle: const TextStyle(
                fontSize: 30,
                color: kWhiteColor,
              ),
            ),
          ),
          Text(
            treatment,
            style: GoogleFonts.cairo(
              textStyle: const TextStyle(
                fontSize: 20,
                color: kWhiteColor,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    image1,
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(image2!)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ErrorCard extends StatelessWidget {
  final String title, subTitle;

  const ErrorCard({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 12, left: 12, bottom: 12),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.cairo(
              textStyle: const TextStyle(
                fontSize: 35,
                color: kWhiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            subTitle,
            style: GoogleFonts.cairo(
              textStyle: const TextStyle(
                fontSize: 22,
                color: kWhiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
