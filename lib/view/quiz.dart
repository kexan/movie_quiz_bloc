import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_quiz_bloc/bloc/quiz_bloc.dart';
import 'package:movie_quiz_bloc/widgets/movie_item.dart';
import 'package:movie_quiz_bloc/widgets/result_dialog.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        switch (state.status) {
          case QuizStatus.initial:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case QuizStatus.quizStarted:
            return MovieItem(
              movie: state.movie,
              ratingToCompare: state.ratingToCompare,
              correctAnswers: state.correctAnswers,
            );
          case QuizStatus.quizEnded:
            return Center(
              child: ResultDialog(
                correctAnswers: state.correctAnswers,
              ),
            );
          case QuizStatus.failure:
            return const Center(child: Text('failed to movie facts'));
        }
      },
    );
  }
}
