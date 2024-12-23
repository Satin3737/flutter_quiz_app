import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/enum.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.switchScreen, {super.key});

  final void Function(Screen screen) switchScreen;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Questions Screen'),
          const SizedBox(height: 32),
          FilledButton(
            onPressed: () => widget.switchScreen(Screen.startScreen),
            child: const Text('Back'),
          )
        ],
      ),
    );
  }
}
