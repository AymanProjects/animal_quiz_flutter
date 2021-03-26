import 'package:animal_quiz/models/Question.dart';
import 'package:animal_quiz/helpers/ScoreManager.dart';
import 'package:animal_quiz/quiz_data/AllQuestions.dart';

class QuizManager {
  static QuizManager _instance;
  Question currentQuestion;
  bool currentQuestionEnded = false;
  bool gameEnded = false;

  static QuizManager instance() {
    if (_instance == null) _instance = new QuizManager._();
    return _instance;
  }

  QuizManager._() {
    currentQuestion = AllQuestions.instance()
        .createQuestionAt(index: ScoreManager.currentScore);
  }

  Future<void> nextQuestion() async {
    await ScoreManager.increment();
    if (ScoreManager.currentScore >= AllQuestions.instance().questions.length) {
      gameEnded = true;
    } else
      currentQuestion = AllQuestions.instance()
          .createQuestionAt(index: ScoreManager.currentScore);
  }

  void restartQuiz() {
    ScoreManager.resetScore();
    AllQuestions.instance().resetQuestions();
    _instance = new QuizManager._();
  }
}
