import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_quiz_bloc/presentation/bloc/quiz/quiz_bloc.dart';
import 'package:movie_quiz_bloc/presentation/view/widgets/movie_item.dart';

class MovieInfo extends StatelessWidget {
  const MovieInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }
}

_buildBody() {
  return BlocBuilder<QuizBloc, QuizState>(
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
        return MovieItem(movie: state.movie);
      }
      return Container();
    },
  );
}
