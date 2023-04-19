import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:python_system/constants.dart';
import 'package:python_system/models/question_model.dart';
import 'package:python_system/screens/result_screen/result_screen.dart';
import 'package:python_system/screens/welcome_screen.dart';

class QuestionsController extends GetxController {
  String name = '';

  //question
  int get countOfQuestion => _questionsList.length;
  final List<QuestionModel> _questionsList = [
    QuestionModel(
      id: 1,
      question: "Q1",
      answer: 0,
      options: ['yes', 'no', 'Q1_op3'],
    ),
    QuestionModel(
      id: 2,
      question: "Q2",
      answer: 0,
      options: ['tough', 'simple'],
    ),
    QuestionModel(
      id: 3,
      question: "Q3",
      answer: 0,
      options: ['knife_strike', 'tingling_or_numbness'],
    ),
    QuestionModel(
      id: 4,
      question: "Q4",
      answer: 0,
      options: ['simple_contraction', 'severe_contraction'],
    ),
    QuestionModel(
      id: 5,
      question: "Q5",
      answer: 0,
      options: ['yes', 'no'],
    ),
    QuestionModel(
      id: 6,
      question: "Q6",
      answer: 0,
      options: ['yes', 'no'],
    ),
    QuestionModel(
      id: 7,
      question: "Q7",
      answer: 0,
      options: ['yes', 'no'],
    ),
    QuestionModel(
      id: 8,
      question: "Q8",
      answer: 0,
      options: ['yes', 'no'],
    ),
    QuestionModel(
      id: 9,
      question: "Question9",
      answer: 0,
      options: ['yes', 'no'],
    ),
    QuestionModel(
      id: 10,
      question: "Q10",
      answer: 0,
      options: ['yes', 'to_some_extent', 'no'],
    ),
    QuestionModel(
      id: 11,
      question: "Q11",
      answer: 0,
      options: ['yes', 'to_some_extent', 'no'],
    ),
    QuestionModel(
      id: 12,
      question: "Q12",
      answer: 0,
      options: ['yes', 'to_some_extent', 'no'],
    ),
    QuestionModel(
      id: 13,
      question: "Q13",
      answer: 0,
      options: ['yes', 'to_some_extent', 'no'],
    ),
    QuestionModel(
      id: 14,
      question: "Q14",
      answer: 0,
      options: ['yes', 'simple', 'no'],
    ),
    QuestionModel(
      id: 15,
      question: "Q15",
      answer: 0,
      options: ['yes', 'no'],
    ),
    QuestionModel(
      id: 16,
      question: "Q16",
      answer: 0,
      options: ['yes', 'no'],
    ),
    QuestionModel(
      id: 17,
      question: "Q17",
      answer: 0,
      options: ['great_pain', 'little_pain', 'no'],
    ),
    QuestionModel(
      id: 18,
      question: "Q18",
      answer: 0,
      options: ['yes', 'no'],
    ),
    QuestionModel(
      id: 19,
      question: "Q19",
      answer: 0,
      options: ['yes', 'simple_movement', 'no'],
    ),
    QuestionModel(
      id: 20,
      question: "َQ20",
      answer: 0,
      options: ['yes', 'no'],
    ),
    QuestionModel(
      id: 21,
      question: "Question21",
      answer: 0,
      options: ['yes', 'no'],
    ),
    QuestionModel(
      id: 22,
      question: "Q22",
      answer: 0,
      options: ['yes', 'no'],
    ),
    QuestionModel(
      id: 23,
      question: "Q23",
      answer: 0,
      options: ['yes', 'no'],
    ),
    QuestionModel(
      id: 24,
      question: "Q24",
      answer: 0,
      options: ['yes', 'no'],
    ),
    QuestionModel(
      id: 25,
      question: "Q25",
      answer: 0,
      options: ['yes', 'no'],
    ),
  ];

  List<QuestionModel> get questionsList => [..._questionsList];

  bool _isPressed = false;

  bool get isPressed => _isPressed; //To check if the answer is pressed

  bool isArabic = false;

  double _numberOfQuestion = 1;

  double get numberOfQuestion => _numberOfQuestion;

  int? _selectAnswer;

  int? get selectAnswer => _selectAnswer;

  int? _selectedAnswer;

  int? _idAnswer;

  //كدم
  int _countOfBruises = 0;

  //تقلص
  int _countOfMuscleContraction = 0;

  //التهاب
  int _countOfMyositis = 0;

  //اجهاد
  int _countOfMuscleStrain = 0;

  //تمزق شد
  int _countOfTighteningOfMuscle = 0;

  //تمزق جزئي
  int _countOfPartialRupture = 0;

  //تمزق كلي
  int _countOfTotalRupture = 0;

  int get countOfBruise => _countOfBruises;

  int get countOfShrank => _countOfMuscleContraction;

  int get countOfInflammation => _countOfMyositis;

  int get countOfStress => _countOfMuscleStrain;

  int get countOfTearTension => _countOfTighteningOfMuscle;

  int get countOfSubTear => _countOfPartialRupture;

  int get countOfTotalRupture => _countOfTotalRupture;

  //map for check if the question has been answered
  final Map<int, bool> _questionIsAnswered = {};

  //page view controller
  late PageController pageController;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    resetAnswer();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  int get bruiseResult {
    return _countOfBruises;
  }

  int get muscleContractionResult {
    return _countOfMuscleContraction;
  }

  int get myositisResult {
    return _countOfMyositis;
  }

  int get muscleStrainResult {
    return _countOfMuscleStrain;
  }

  int get tighteningOfMuscleResult {
    return _countOfTighteningOfMuscle;
  }

  int get partialRuptureResult {
    return _countOfPartialRupture;
  }

  int get totalRuptureResult {
    return _countOfTotalRupture;
  }

  void checkAnswer(QuestionModel questionModel, int selectAnswer) {
    _isPressed = true;

    _selectAnswer = selectAnswer;
    _selectedAnswer = questionModel.answer;

    _idAnswer = questionModel.id;

    if (_idAnswer == 1) {
      if (_selectAnswer == _selectedAnswer) {
        _countOfBruises++;
        _countOfMuscleContraction++;
      } else if (_selectAnswer == _selectedAnswer! + 1) {
        _countOfPartialRupture++;
        _countOfTotalRupture++;
      } else if (_selectAnswer == _selectedAnswer! + 2) {
        _countOfTighteningOfMuscle++;
      }
    }
    if (_idAnswer == 2) {
      if (_selectAnswer == _selectedAnswer) {
        _countOfBruises++;
        _countOfPartialRupture++;
        _countOfTotalRupture++;
      } else if (_selectAnswer == _selectedAnswer! + 1) {
        _countOfTighteningOfMuscle++;
      }
    }
    if (_idAnswer == 3) {
      if (_selectAnswer == _selectedAnswer) {
        _countOfPartialRupture++;
      } else if (_selectAnswer == _selectedAnswer! + 1) {
        _countOfBruises++;
        _countOfMuscleContraction++;
      }
    }
    if (_idAnswer == 4) {
      if (_selectAnswer == _selectedAnswer! + 1) {
        _countOfMuscleContraction += 2;
      }
    }
    if (_idAnswer == 5) {
      if (_selectAnswer == _selectedAnswer) {
        _countOfMyositis++;
        _countOfMuscleStrain++;
      }
    }
    if (_idAnswer == 6) {
      if (_selectAnswer == _selectedAnswer) {
        _countOfMyositis++;
        _countOfMuscleStrain++;
      }
    }
    if (_idAnswer == 7) {
      if (_selectAnswer == _selectedAnswer) {
        _countOfMyositis++;
      }
    }
    if (_idAnswer == 8) {
      if (_selectAnswer == _selectedAnswer) {
        _countOfMyositis++;
      }
    }
    if (_idAnswer == 9) {
      if (_selectAnswer == _selectedAnswer) {
        _countOfMuscleStrain++;
      }
    }
    if (_idAnswer == 10) {
      if (_selectAnswer == _selectedAnswer) {
        _countOfBruises++;
        _countOfPartialRupture++;
        _countOfTotalRupture++;
      }
    }
    if (_idAnswer == 11) {
      if (_selectAnswer == _selectedAnswer) {
        _countOfBruises++;
        _countOfPartialRupture++;
        _countOfTotalRupture++;
      } else if (_selectAnswer == _selectedAnswer! + 1) {
        _countOfTighteningOfMuscle++;
      } else if (_selectAnswer == _selectedAnswer! + 2) {
        _countOfMuscleContraction++;
        _countOfMyositis++;
        _countOfMuscleStrain++;
      }
    }
    if (_idAnswer == 12) {
      if (_selectAnswer == _selectedAnswer) {
        _countOfBruises++;
        _countOfPartialRupture++;
        _countOfTotalRupture++;
      } else if (_selectAnswer == _selectedAnswer! + 1) {
        _countOfTighteningOfMuscle++;
      } else if (_selectAnswer == _selectedAnswer! + 2) {
        _countOfMuscleContraction++;
        _countOfMyositis++;
        _countOfMuscleStrain++;
      }
    }
    if (_idAnswer == 13) {
      if (_selectAnswer == _selectedAnswer) {
        _countOfBruises++;
        _countOfPartialRupture++;
      }
    }
    if (_idAnswer == 14) {
      if (_selectAnswer == _selectedAnswer) {
        _countOfTotalRupture += 2;
      } else if (_selectAnswer == _selectedAnswer! + 1) {
        _countOfPartialRupture++;
      }
    }
    if (_idAnswer == 15) {
      if (_selectAnswer == _selectedAnswer) {
        _countOfBruises++;
        _countOfPartialRupture++;
        _countOfTotalRupture++;
      }
    }
    if (_idAnswer == 16) {
      if (_selectAnswer == _selectedAnswer) {
        _countOfMuscleContraction += 2;
      }
    }
    if (_idAnswer == 17) {
      if (_selectAnswer == _selectedAnswer) {
        _countOfTighteningOfMuscle++;
        _countOfPartialRupture++;
        _countOfTotalRupture++;
      } else if (_selectAnswer == _selectedAnswer! + 1) {
        _countOfBruises++;
        _countOfMyositis++;
        _countOfMuscleStrain++;
      }
    }
    if (_idAnswer == 18) {
      if (_selectAnswer == _selectedAnswer) {
        _countOfMuscleStrain++;
      }
    }
    if (_idAnswer == 19) {
      if (_selectAnswer == _selectedAnswer) {
        _countOfMuscleStrain++;
        _countOfTotalRupture += 2;
      } else if (_selectAnswer == _selectedAnswer! + 1) {
        _countOfBruises++;
        _countOfMyositis++;
        _countOfTighteningOfMuscle++;
        _countOfPartialRupture++;
      } else if (_selectAnswer == _selectedAnswer! + 2) {
        _countOfMuscleContraction++;
      }
    }
    if (_idAnswer == 20) {
      if (_selectAnswer == _selectedAnswer) {
        _countOfBruises *= 3;
      }
    }
    if (_idAnswer == 21) {
      if (_selectAnswer == _selectedAnswer) {
        _countOfTighteningOfMuscle *= 3;
        _countOfPartialRupture *= 3;
      }
    }
    if (_idAnswer == 22) {
      if (_selectAnswer == _selectedAnswer) {
        _countOfMuscleContraction *= 3;
        _countOfPartialRupture *= 3;
        _countOfTotalRupture *= 3;
      }
    }
    if (_idAnswer == 23) {
      if (_selectAnswer == _selectedAnswer) {
        _countOfMuscleContraction *= 3;
      }
    }
    if (_idAnswer == 24) {
      if (_selectAnswer == _selectedAnswer) {
        _countOfMyositis *= 3;
      }
    }
    if (_idAnswer == 25) {
      if (_selectAnswer == _selectedAnswer) {
        _countOfMuscleStrain *= 3;
      }
    }

    _questionIsAnswered.update(questionModel.id, (value) => true);
    Future.delayed(const Duration(milliseconds: 500))
        .then((value) => nextQuestion());
    update();
  }

  //check if the question has been answered
  bool checkIsQuestionAnswered(int quesId) {
    return _questionIsAnswered.entries
        .firstWhere((element) => element.key == quesId)
        .value;
  }

  void nextQuestion() {
    if (pageController.page == _questionsList.length - 1) {
      Get.offAndToNamed(ResultScreen.routeName);
    } else if (_idAnswer! >= 20 && _selectAnswer == _selectedAnswer) {
      Get.offAndToNamed(ResultScreen.routeName);
    } else {
      _isPressed = false;
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.linear);
    }
    _numberOfQuestion = pageController.page! + 2;
    update();
  }

  //called when start again quiz
  void resetAnswer() {
    for (var element in _questionsList) {
      _questionIsAnswered.addAll({element.id: false});
    }
    update();
  }

  //get right and wrong color
  Color getColor(int answerIndex) {
    if (_isPressed) {
      if (answerIndex == _selectAnswer) {
        return kSecColor;
      }
    }
    return Colors.white;
  }

  //call when start again
  void startAgain() {
    _selectedAnswer = null;
    _countOfBruises = 0;
    _countOfMuscleContraction = 0;
    _countOfMyositis = 0;
    _countOfMuscleStrain = 0;
    _countOfTighteningOfMuscle = 0;
    _countOfPartialRupture = 0;
    _countOfTotalRupture = 0;
    _numberOfQuestion = 1;
    resetAnswer();
    _selectAnswer = null;
    Get.offAllNamed(WelcomeScreen.routeName);
  }
}
