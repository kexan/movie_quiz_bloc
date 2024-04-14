import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/quiz_bloc.dart';

class ResultDialog extends StatelessWidget {
  final int correctAnswers;

  const ResultDialog({super.key, required this.correctAnswers});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Результаты"),
      content: Text("Правильных ответов $correctAnswers из 10"),
      actions: [
        TextButton(
          onPressed: () {
            BlocProvider.of<QuizBloc>(context).add(
              RestartButtonPressed(),
            );
            Navigator.of(context).pop();
          },
          child: const Text("Можем повторить"),
        ),
      ],
    );
  }
}
