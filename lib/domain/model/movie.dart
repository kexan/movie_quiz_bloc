import 'package:equatable/equatable.dart';

import '../../data/api/model/movie/api_movie.dart';

class Movie extends Equatable {
  final int kinopoiskId;
  final double ratingKinopoisk;
  final String posterUrlPreview;

  const Movie({
    required this.kinopoiskId,
    required this.ratingKinopoisk,
    required this.posterUrlPreview,
  });

  factory Movie.fromApi(ApiMovie apiMovie) => Movie(
        kinopoiskId: apiMovie.kinopoiskId,
        ratingKinopoisk: apiMovie.ratingKinopoisk,
        posterUrlPreview: apiMovie.posterUrlPreview,
      );

  Movie copyWith({
    int? kinopoiskId,
    double? ratingKinopoisk,
    String? posterUrlPreview,
  }) =>
      Movie(
        kinopoiskId: kinopoiskId ?? this.kinopoiskId,
        ratingKinopoisk: ratingKinopoisk ?? this.ratingKinopoisk,
        posterUrlPreview: posterUrlPreview ?? this.posterUrlPreview,
      );

  @override
  List<Object?> get props => [kinopoiskId];
}
