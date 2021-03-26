import 'package:animal_quiz/helpers/QuizManager.dart';
import 'package:flutter/material.dart';
import 'package:animal_quiz/helpers/colors.dart';

class ChoiceWidget extends StatefulWidget {
  final String value;
  final bool isAnswer;
  final Function(String) onSelected;
  ChoiceWidget({
    this.value,
    this.isAnswer,
    this.onSelected,
  });

  @override
  _ChoiceWidgetState createState() => _ChoiceWidgetState();
}

class _ChoiceWidgetState extends State<ChoiceWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: isSelected
            ? (widget.isAnswer ? success : danger)
            : Colors.transparent,
      ),
      child: TextButton(
        style: ButtonStyle(
          padding:
              MaterialStateProperty.resolveWith((states) => EdgeInsets.zero),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed))
              return Color.fromRGBO(0, 0, 0, 0.1);
            return Colors.transparent;
          }),
          overlayColor: MaterialStateProperty.resolveWith((states) {
            return Colors.transparent;
          }),
        ),
        onPressed: () async {
          if (!QuizManager.instance().currentQuestionEnded &&
              !QuizManager.instance().gameEnded) {
            setState(() {
              isSelected = true;
            });
            await widget.onSelected(widget.value);
            setState(() {
              isSelected = false;
            });
          }
        },
        child: Center(
          child: Text(
            widget.value,
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
