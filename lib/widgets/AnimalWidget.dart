import 'package:animal_quiz/helpers/QuizManager.dart';
import 'package:animal_quiz/quiz_data/AllQuestions.dart';
import 'package:flutter/material.dart';

class AnimalWidget extends StatefulWidget {
  final String imgPath;
  final AnimationController controller;
  AnimalWidget({this.imgPath, this.controller});

  @override
  _AnimalWidgetState createState() => _AnimalWidgetState();
}

class _AnimalWidgetState extends State<AnimalWidget> {
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(widget.controller);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _animation.value,
      child: !QuizManager.instance().gameEnded
          ? Row(
              children: [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1.5,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 10),
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                          image: AssetImage(widget.imgPath),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Center(
              child: Container(
                width: 300,
                child: Text(
                  'You Have Answered All ${AllQuestions.instance().questions.length} Questions! yay 🎉',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white70),
                ),
              ),
            ),
    );
  }
}
