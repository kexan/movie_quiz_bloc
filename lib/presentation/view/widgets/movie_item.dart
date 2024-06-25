import 'package:flutter/material.dart';
import 'package:movie_quiz_bloc/presentation/view/widgets/movie_photo.dart';

import '../../../domain/model/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MoviePhoto(
          height: 450,
          urlPreview: movie.posterUrlPreview,
          onTap: () {},
        ),
        Text(
          movie.nameRu ?? "У фильма нет названия на русском",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          movie.year.toString(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical, // Прокрутка по вертикали
            child: Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  movie.description ?? "У фильма нет описания",
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
          ),
        ),
      ],
    );
  }
}
