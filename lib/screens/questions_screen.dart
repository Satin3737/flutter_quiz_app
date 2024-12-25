import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/ui/answer_button.dart';
import 'package:flutter_quiz_app/ui/screen_title.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onAnswerSelect});

  final void Function(String answer) onAnswerSelect;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void onAnswerTap(String answer) {
    widget.onAnswerSelect(answer);

    if (questions.length > currentQuestionIndex + 1) {
      setState(() => currentQuestionIndex++);
    } else {
      currentQuestionIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 4,
        children: [
          ScreenTitle(currentQuestion.question),
          const SizedBox(height: 16),
          ...currentQuestion.getShuffledAnswers().map((answer) {
            return AnswerButton(
              answer: answer,
              onPressed: () => onAnswerTap(answer),
            );
          }),
        ],
      ),
    );
  }
}
