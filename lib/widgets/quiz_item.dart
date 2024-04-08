import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_quiz_bloc/bloc/quiz_bloc.dart';
import '../model/movie.dart';

class QuizItem extends StatelessWidget {
  final Movie movie;
  final int ratingToCompare;
  final int correctAnswers;

  const QuizItem({
    super.key,
    required this.movie,
    required this.ratingToCompare,
    required this.correctAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MoviePhoto(movie: movie),
        Text(
          "Рейтинг этого фильма больше чем $ratingToCompare?",
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        const ButtonsRow()
      ],
    );
  }
}

class MoviePhoto extends StatelessWidget {
  const MoviePhoto({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: Card(
        elevation: 10,
        margin: const EdgeInsets.all(30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.network(
            movie.posterUrlPreview,
          ),
        ),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 60,
          width: 150,
          child: FilledButton(
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Colors.red,
              elevation: 5,
            ),
            onPressed: () =>
                BlocProvider.of<QuizBloc>(context).add(NoButtonPressed()),
            child: const Text(
              "Нет",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 60,
          width: 150,
          child: FilledButton(
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Colors.green,
              elevation: 5,
            ),
            onPressed: () =>
                BlocProvider.of<QuizBloc>(context).add(YesButtonPressed()),
            child: const Text(
              "Да",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
