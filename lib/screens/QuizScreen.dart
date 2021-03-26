import 'package:animal_quiz/widgets/ChoicesListWidget.dart';
import 'package:animal_quiz/widgets/GradientBackground.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:animal_quiz/helpers/QuizManager.dart';
import 'package:animal_quiz/widgets/AnimalWidget.dart';
import 'package:animal_quiz/helpers/colors.dart';
import 'package:animal_quiz/widgets/ScoreWidget.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with TickerProviderStateMixin {
  AnimationController animalAnimationController;

  @override
  void initState() {
    super.initState();
    animalAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    animalAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientColorStart,
      body: GradientBackground(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ScoreWidget(),
              SizedBox(height: 20.0),
              Expanded(
                child: AnimalWidget(
                  controller: animalAnimationController,
                  imgPath: QuizManager.instance().currentQuestion.imgPath,
                ),
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: ChoicesListWidget(
                  onChoiceSelected: onChoiceSelected,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onChoiceSelected(String selectedValue) async {
    QuizManager.instance().currentQuestionEnded = true;
    if (selectedValue == QuizManager.instance().currentQuestion.answer) {
      await animalAnimationController.forward().whenComplete(() async {
        await QuizManager.instance().nextQuestion();
        animalAnimationController.reverse();
      });
    } else {
      await Future.delayed(Duration(seconds: 1));
      QuizManager.instance().restartQuiz();
      setState(() {});
    }
    QuizManager.instance().currentQuestionEnded = false;
    return;
  }
}
