import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/enum.dart';
import 'package:flutter_quiz_app/questions_screen.dart';
import 'package:flutter_quiz_app/start_screen.dart';

final duration = Duration(milliseconds: 300);
final curve = Curves.easeInOut;

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var currentScreen = Screen.startScreen;
  var roll = 1;
  var _opacity = 1.0;

  void switchScreen(Screen screen) {
    setState(() {
      _opacity = 0.0;
    });

    Future.delayed(duration, () {
      setState(() {
        currentScreen = screen;
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (currentScreen == Screen.startScreen) {
      screenWidget = StartScreen(switchScreen);
    }

    if (currentScreen == Screen.questionsScreen) {
      screenWidget = QuestionsScreen(switchScreen);
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
          child: AnimatedOpacity(
            opacity: _opacity,
            duration: duration,
            curve: curve,
            child: screenWidget,
          ),
        ),
      ),
    );
  }
}
