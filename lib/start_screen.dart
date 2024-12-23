import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/enum.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});

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
          Title(
            title: 'Learn Flutter the fun way!',
            color: Colors.white,
            child: const Text(
              'Learn Flutter the fun way!',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          const SizedBox(height: 32),
          OutlinedButton.icon(
            onPressed: () => switchScreen(Screen.questionsScreen),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              foregroundColor: Colors.white,
              iconColor: Colors.white,
              side: const BorderSide(color: Colors.white),
              textStyle: const TextStyle(fontSize: 20),
            ),
            icon: const Icon(Icons.play_arrow),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
