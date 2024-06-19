import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_quiz_bloc/bloc/quiz_bloc.dart';
import 'package:movie_quiz_bloc/widgets/quiz_item.dart';
import 'package:movie_quiz_bloc/widgets/result_dialog.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizBloc, QuizState>(
        listener: (context, state) {
      if (state.status == QuizStatus.quizEnded) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ResultDialog(correctAnswers: state.correctAnswers);
          },
        );
      }
    },
        builder: (context, state) {
      switch (state.status) {
        case QuizStatus.initial:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case QuizStatus.failure:
          return const Material(
            child: Center(
              child: Text('Не удалось получить фильмы'),
            ),
          );
        default:
          return QuizItem(
            movie: state.movie,
            ratingToCompare: state.ratingToCompare,
            correctAnswers: state.correctAnswers,
          );
      }
    });
  }
}
