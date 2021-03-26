import 'dart:math';
import 'package:animal_quiz/quiz_data/AllChoices.dart';


class Question {
  List<String> choices;
  final String answer;
  String imgPath;

  Question({this.answer}) {
    imgPath = 'images/$answer.jpg';
    choices = List<String>();
    choices.add(answer);
    while (choices.length < 4) {
      String nominated = allChoices[Random().nextInt(allChoices.length - 1)];
      if (!choices.contains(nominated)) {
        choices.add(nominated);
      }
    }
    choices.shuffle();
  }
}
