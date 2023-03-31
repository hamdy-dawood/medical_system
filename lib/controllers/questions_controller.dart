import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:python_system/constants.dart';
import 'package:python_system/models/question_model.dart';
import 'package:python_system/screens/result_screen/result_screen.dart';
import 'package:python_system/screens/welcome_screen.dart';

class QuestionsController extends GetxController {
  String name = '';

  //question variables
  int get countOfQuestion => _questionsList.length;
  final List<QuestionModel> _questionsList = [
    QuestionModel(
      id: 1,
      question: "Can the player use the injured muscle and continue playing?",
      answer: 0,
      options: ['YES', 'NO', 'Relatively poor muscle strength'],
    ),
    QuestionModel(
      id: 2,
      question: "Is there bleeding/oozing blood?",
      answer: 0,
      options: ['Tough', 'Simple'],
    ),
    QuestionModel(
      id: 3,
      question: "Feeling pain as/like .. ",
      answer: 0,
      options: ['knife strike', 'tingling or numbness'],
    ),
    QuestionModel(
      id: 4,
      question: "Is there a continuous contraction in the affected muscle?",
      answer: 0,
      options: ['Simple contraction', 'Severe contraction'],
    ),
    QuestionModel(
      id: 5,
      question: "Do you feel stiff/rigorism when stressed?",
      answer: 0,
      options: ['YES', 'NO'],
    ),
    QuestionModel(
      id: 6,
      question: "Do you feel weak in the muscle and lack of flexibility ?",
      answer: 0,
      options: ['YES', 'NO'],
    ),
    QuestionModel(
      id: 7,
      question: "Do you notice an increase in symptoms when exposed to a cold?",
      answer: 0,
      options: ['YES', 'NO'],
    ),
    QuestionModel(
      id: 8,
      question:
          "Do you feel pain when the doctor presses on the affected area, the bone with the muscles from which they germinate/sprout",
      answer: 0,
      options: ['YES', 'NO'],
    ),
    QuestionModel(
      id: 9,
      question:
          "Do you feel very tired and exhausted, and the level of physical capabilities decreases?",
      answer: 0,
      options: ['YES', 'NO'],
    ),
    QuestionModel(
      id: 10,
      question:
          "Do you notice a gradual increase in swelling during the first twenty-four hours of the injury?",
      answer: 0,
      options: ['YES', 'To some extent', 'NO'],
    ),
    QuestionModel(
      id: 11,
      question: "Does the skin color change?",
      answer: 0,
      options: ['YES', 'To some extent', 'NO'],
    ),
    QuestionModel(
      id: 12,
      question: "Is there a tumor?",
      answer: 0,
      options: ['YES', 'To some extent', 'NO'],
    ),
    QuestionModel(
      id: 13,
      question:
          "Is the blood gathering clear around the site of the injury, especially after 48 hours have passed?",
      answer: 0,
      options: ['YES', 'To some extent', 'NO'],
    ),
    QuestionModel(
      id: 14,
      question: "Is there a gap or depression in the place of injury?",
      answer: 0,
      options: ['YES', 'Simple', 'NO'],
    ),
    QuestionModel(
      id: 15,
      question: "Does the temperature change locally?",
      answer: 0,
      options: ['YES', 'NO'],
    ),
    QuestionModel(
      id: 16,
      question:
          "Is the continuous contraction can be seen and touched by hand?",
      answer: 0,
      options: ['YES', 'NO'],
    ),
    QuestionModel(
      id: 17,
      question:
          "Do you feel pain when moving the joint on which the muscle works, which leads to a limitation in the movement of the joint",
      answer: 0,
      options: ['great pain', 'little pain', 'NO'],
    ),
    QuestionModel(
      id: 18,
      question: "Is there a low level of neuromuscular compatibility?",
      answer: 0,
      options: ['YES', 'NO'],
    ),
    QuestionModel(
      id: 19,
      question: "Can you move the injured muscle?",
      answer: 0,
      options: ['YES', 'Simple movement', 'NO'],
    ),
    QuestionModel(
      id: 20,
      question:
          "As a result of an external shock or external violence, such as colliding with a solid object or the player's body",
      answer: 0,
      options: ['YES', 'NO'],
    ),
    QuestionModel(
      id: 21,
      question:
          "As a result of too much stretching of some fibers in the muscle",
      answer: 0,
      options: ['YES', 'NO'],
    ),
    QuestionModel(
      id: 22,
      question:
          "As a result of the sudden violent muscle contraction to resist a supernatural force the moment it occurs when the muscle is not prepared for that",
      answer: 0,
      options: ['YES', 'NO'],
    ),
    QuestionModel(
      id: 23,
      question:
          "The result of an involuntary muscle contraction that cannot be relaxed",
      answer: 0,
      options: ['YES', 'NO'],
    ),
    QuestionModel(
      id: 24,
      question:
          "As a result of chronic stress and tension on the small fibers that connect the muscle to the bone area associated with it",
      answer: 0,
      options: ['YES', 'NO'],
    ),
    QuestionModel(
      id: 25,
      question:
          "As a result of a decrease in the efficiency and ability to play with a feeling of severe pain when performing muscular effort",
      answer: 0,
      options: ['YES', 'NO'],
    ),
  ];

  List<QuestionModel> get questionsList => [..._questionsList];

  bool _isPressed = false;

  bool get isPressed => _isPressed; //To check if the answer is pressed

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
        return kPrimaryColor;
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
    _numberOfQuestion= 1;
    resetAnswer();
    _selectAnswer = null;
    Get.offAllNamed(WelcomeScreen.routeName);
  }
}
