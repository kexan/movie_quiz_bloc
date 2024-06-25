import 'package:flutter/material.dart';

import '../../../domain/model/movie.dart';
import 'button.dart';
import 'movie_item.dart';

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
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MovieItem(urlPreview: movie.posterUrlPreview),
        Text(
          "Рейтинг этого фильма больше чем $ratingToCompare?",
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const ButtonsRow()
      ],
    );
  }
}


