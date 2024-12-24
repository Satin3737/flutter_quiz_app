import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/enum.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.switchScreen,
    required this.selectedAnswers,
    required this.dropSelectedAnswers,
  });

  final void Function(Screen screen) switchScreen;
  final void Function() dropSelectedAnswers;
  final List<String> selectedAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'questionIndex': i,
        'question': questions[i].question,
        'correctAnswer': questions[i].answers[0],
        'userAnswer': selectedAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('You answered all the questions!'),
          SizedBox(height: 32),
          Text('Your score is 5 out of 5'),
          SizedBox(height: 32),
          TextButton(
            onPressed: () => {
              switchScreen(Screen.startScreen),
              dropSelectedAnswers(),
            },
            child: Text(
              'Play Again',
            ),
          ),
        ],
      ),
    );
  }
}
