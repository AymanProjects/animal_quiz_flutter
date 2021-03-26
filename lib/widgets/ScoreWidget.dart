import 'package:flutter/material.dart';
import 'package:animal_quiz/helpers/ScoreManager.dart';
import 'package:animal_quiz/quiz_data/AllQuestions.dart';

class ScoreWidget extends StatefulWidget {
  @override
  _ScoreWidgetState createState() => _ScoreWidgetState();
}

class _ScoreWidgetState extends State<ScoreWidget> {
  Future bestScoreFuture;
  @override
  void initState() {
    super.initState();
    bestScoreFuture = ScoreManager.initBestScore();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Text(
          '${ScoreManager.currentScore}/${AllQuestions.instance().questions.length}',
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        Row(
          children: [
            FutureBuilder(
              future: bestScoreFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    'Best: ${ScoreManager.bestScore}',
                    style: TextStyle(color: Colors.white70),
                  );
                } else
                  return Container(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
                    ),
                  );
              },
            ),
          ],
        ),
      ],
    );
  }
}
