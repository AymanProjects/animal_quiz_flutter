import 'package:animal_quiz/helpers/QuizManager.dart';
import 'package:animal_quiz/widgets/ChoiceWidget.dart';
import 'package:flutter/material.dart';

class ChoicesListWidget extends StatelessWidget {
  final Function(String) onChoiceSelected;
  ChoicesListWidget({this.onChoiceSelected});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: QuizManager.instance().currentQuestion.choices.map((choice) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ChoiceWidget(
            value: choice,
            isAnswer: QuizManager.instance().currentQuestion.answer == choice,
            onSelected: onChoiceSelected,
          ),
        );
      }).toList(),
    );
  }
}
