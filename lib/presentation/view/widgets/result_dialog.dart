import 'package:flutter/material.dart';

class ResultDialog extends StatelessWidget {
  final VoidCallback onPressed;
  final int correctAnswers;

  const ResultDialog({
    super.key,
    required this.onPressed,
    required this.correctAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Результаты"),
      content: Text("Правильных ответов $correctAnswers из 10"),
      actions: [
        TextButton(
          onPressed: () {
            onPressed();
            Navigator.of(context).pop();
          },
          child: const Text("Можем повторить"),
        ),
      ],
    );
  }
}
