import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/enum.dart';
import 'package:flutter_quiz_app/ui/quiz_button.dart';
import 'package:flutter_quiz_app/ui/screen_title.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.switchScreen});

  final void Function(Screen screen) switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: Color.fromRGBO(255, 255, 255, 0.4),
          ),
          const SizedBox(height: 72),
          ScreenTitle('Learn Flutter the fun way!'),
          const SizedBox(height: 32),
          QuizButton(
            label: 'Start Quiz',
            icon: Icons.play_arrow,
            onPressed: () => switchScreen(Screen.questionsScreen),
          )
        ],
      ),
    );
  }
}
