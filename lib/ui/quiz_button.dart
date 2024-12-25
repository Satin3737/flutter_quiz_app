import 'package:flutter/material.dart';

class QuizButton extends StatelessWidget {
  const QuizButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
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
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
