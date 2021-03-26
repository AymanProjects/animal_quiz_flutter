import 'package:animal_quiz/models/Question.dart';

class AllQuestions {
  static AllQuestions _instance;
  AllQuestions._() {
    questions.shuffle();
  }

  static AllQuestions instance() {
    if (_instance == null) _instance = new AllQuestions._();
    return _instance;
  }

  void resetQuestions() {
    questions.shuffle();
  }

  createQuestionAt({int index}) {
    return new Question(answer: questions[index].answer);
  }

  List<Question> questions = [
    Question(answer: 'Peacock'),
    Question(answer: 'Hummingbird'),
    Question(answer: 'Snail'),
    Question(answer: 'Wasp'),
    Question(answer: 'Seagull'),
    Question(answer: 'Turtle'),
    Question(answer: 'Squirrel'),
    Question(answer: 'Hippo'),
    Question(answer: 'Alligator'),
    Question(answer: 'Shark'),
    Question(answer: 'Duck'),
    Question(answer: 'Snake'),
    Question(answer: 'Goat'),
    Question(answer: 'Butterfly'),
    Question(answer: 'Frog'),
    Question(answer: 'Rabbit'),
    Question(answer: 'Fish'),
    Question(answer: 'Moose'),
    Question(answer: 'Lion'),
    Question(answer: 'Hedgehog'),
    Question(answer: 'Horse'),
    Question(answer: 'Lizard'),
    Question(answer: 'Fox'),
    Question(answer: 'Chick'),
    Question(answer: 'Raven'),
    Question(answer: 'Owl'),
    Question(answer: 'Panda'),
    Question(answer: 'Raccoon'),
    Question(answer: 'Hamster'),
    Question(answer: 'Penguin'),
    Question(answer: 'Rhino'),
    Question(answer: 'Jellyfish'),
    Question(answer: 'Eagle'),
    Question(answer: 'Tiger'),
    Question(answer: 'Spider'),
    Question(answer: 'Parrot'),
    Question(answer: 'Deer'),
    Question(answer: 'Cat'),
    Question(answer: 'Wolf'),
    Question(answer: 'Dog'),
    Question(answer: 'Sealion'),
    Question(answer: 'Pigeon'),
    Question(answer: 'Chameleon'),
    Question(answer: 'Llama'),
    Question(answer: 'Hyena'),
    Question(answer: 'Ladybug'),
    Question(answer: 'Meerkat'),
    Question(answer: 'Swan'),
    Question(answer: 'Lemur'),
    Question(answer: 'Dragonfly'),
    Question(answer: 'Cricket'),
    Question(answer: 'Crab'),
    Question(answer: 'Elephant'),
    Question(answer: 'Camel'),
    Question(answer: 'Zebra'),
    Question(answer: 'Donkey'),
    Question(answer: 'Bee'),
    Question(answer: 'Octopus'),
    Question(answer: 'Ray'),
    Question(answer: 'Sheep'),
    Question(answer: 'Woodpecker'),
    Question(answer: 'Scorpion'),
    Question(answer: 'Bull'),
    Question(answer: 'Seahorse'),
    Question(answer: 'Koala'),
    Question(answer: 'Giraffe'), //66
  ];
}
