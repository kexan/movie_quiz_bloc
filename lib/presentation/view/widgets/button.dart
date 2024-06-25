import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/quiz/quiz_bloc.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;

  const Button({
    super.key,
    required this.onPressed,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 150,
      child: FilledButton(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: color,
          elevation: 5,
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Button(
              onPressed: () => context.read<QuizBloc>().add(NoButtonPressed()),
              text: "Нет",
              color: Colors.red,
            ),
            Button(
              onPressed: () => context.read<QuizBloc>().add(YesButtonPressed()),
              text: "Да",
              color: Colors.green,
            ),
          ],
        );
      },
    );
  }
}
