import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animal_quiz/helpers/colors.dart';
import 'package:animal_quiz/screens/QuizScreen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: gradientColorStart,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: gradientColorEnd,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: '66 Animals',
      theme: ThemeData(
        fontFamily: 'rounded',
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: QuizScreen()),
    );
  }
}
