import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/model/movie.dart';
import '../../bloc/quiz_bloc.dart';

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
        MoviePhoto(urlPreview: movie.posterUrlPreview),
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

class MoviePhoto extends StatelessWidget {
  final String urlPreview;

  const MoviePhoto({
    super.key,
    required this.urlPreview,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: SizedBox(
        height: 500,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: CachedNetworkImage(
            imageUrl: urlPreview,
            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.cover,
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
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtonWidget(
              onPressed: () => context.read<QuizBloc>().add(NoButtonPressed()),
              text: "Нет",
              color: Colors.red,
            ),
            ButtonWidget(
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

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;

  const ButtonWidget({
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
