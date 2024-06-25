import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_quiz_bloc/presentation/bloc/quiz/quiz_bloc.dart';
import 'package:movie_quiz_bloc/presentation/view/widgets/result_dialog.dart';

import 'widgets/quiz_item.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }
}

_buildBody() {
  return BlocConsumer<QuizBloc, QuizState>(
    listener: (context, state) {
      if (state is QuizEndedState) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ResultDialog(
                onPressed: () {
                  context.read<QuizBloc>().add(RestartButtonPressed());
                },
                correctAnswers: state.correctAnswers);
          },
          barrierDismissible: false,
        );
      }
    },
    builder: (context, state) {
      if (state is QuizInitialState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is QuizLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is QuizFulfilledState) {
        return QuizItem(
          movie: state.movie,
          ratingToCompare: state.ratingToCompare,
          correctAnswers: state.correctAnswers,
        );
      }
      if (state is QuizErrorState) {
        return Center(
          child: Text(state.message),
        );
      }
      return Container(); //заглушка
    },
    buildWhen: (state, currentState) {
      return currentState is! QuizEndedState;
      //это чтобы при показе диалога уи не перерисовывалось и диалог отображался "поверх"
    },
  );
}
