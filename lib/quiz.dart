import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/enum.dart';
import 'package:flutter_quiz_app/screens/questions_screen.dart';
import 'package:flutter_quiz_app/screens/result_screen.dart';
import 'package:flutter_quiz_app/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var currentScreen = Screen.startScreen;
  List<String> selectedAnswers = [];

  void dropSelectedAnswers() => selectedAnswers = [];

  void switchScreen(Screen screen) {
    setState(() {
      currentScreen = screen;
    });
  }

  void onAnswerSelect(String answer) {
    selectedAnswers.add(answer);

    if (questions.length == selectedAnswers.length) {
      switchScreen(Screen.resultScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen: switchScreen);

    if (currentScreen == Screen.questionsScreen) {
      screenWidget = QuestionsScreen(onAnswerSelect: onAnswerSelect);
    }

    if (currentScreen == Screen.resultScreen) {
      screenWidget = ResultScreen(
        switchScreen: switchScreen,
        selectedAnswers: selectedAnswers,
        dropSelectedAnswers: dropSelectedAnswers,
      );
    }

    return MaterialApp(
      title: 'Quiz App',
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.deepPurple, Colors.purple],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
