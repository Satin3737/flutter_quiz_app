import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/enum.dart';
import 'package:flutter_quiz_app/ui/question_summary.dart';
import 'package:flutter_quiz_app/ui/quiz_button.dart';
import 'package:flutter_quiz_app/ui/screen_title.dart';

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
    final summary = getSummaryData();
    final correctAnswersNumber = summary.where((data) {
      return data['correctAnswer'] == data['userAnswer'];
    }).length;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 32,
      children: [
        ScreenTitle(
          'You answered $correctAnswersNumber questions of ${questions.length} correctly!',
        ),
        QuestionSummary(summary: summary),
        QuizButton(
          label: 'Play Again',
          icon: Icons.restart_alt,
          onPressed: () => {
            switchScreen(Screen.startScreen),
            dropSelectedAnswers(),
          },
        )
      ],
    );
  }
}
