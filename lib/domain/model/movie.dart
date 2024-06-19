import 'package:equatable/equatable.dart';
import 'package:movie_quiz_bloc/data/api/api_movie.dart';

class Movie extends Equatable {
  final int kinopoiskId;
  final double? ratingKinopoisk;
  final String posterUrlPreview;

  const Movie({
    required this.kinopoiskId,
    required this.ratingKinopoisk,
    required this.posterUrlPreview,
  });

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

  factory Movie.fromApi(ApiMovie apiMovie) => Movie(
        kinopoiskId: apiMovie.kinopoiskId,
        ratingKinopoisk: apiMovie.ratingKinopoisk,
        posterUrlPreview: apiMovie.posterUrlPreview,
      );

  @override
  List<Object?> get props => [kinopoiskId];
}
