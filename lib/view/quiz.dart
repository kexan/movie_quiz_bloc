import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_quiz_bloc/bloc/movie_bloc.dart';
import 'package:movie_quiz_bloc/widgets/movie_item.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
      switch (state.status) {
        case MovieStatus.initial:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case MovieStatus.success:
          return MovieItem(
            movie: state.movie,
            ratingToCompare: state.ratingToCompare,
          );
        case MovieStatus.failure:
          return const Center(child: Text('failed to movie facts'));
      }
    });
  }
}
