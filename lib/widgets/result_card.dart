import 'package:flutter/material.dart';
import 'package:python_system/constants.dart';

class ResultCard extends StatelessWidget {
  final String title, subTitle, image1;
  final String? image2;

  const ResultCard({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.image1,
    this.image2 = "assets/space.png",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kSecColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 30,
                color: kPrimaryColor,
                fontWeight: FontWeight.bold),
          ),
          Text(
            subTitle,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image.asset(
                image1,
                fit: BoxFit.fitWidth,
                width: double.infinity,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image.asset(image2!),
            ),
          ),
        ],
      ),
    );
  }
}
