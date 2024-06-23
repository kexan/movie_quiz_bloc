import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../data/api/model/movie/api_movie.dart';

part 'movie.g.dart';

@HiveType(typeId: 0)
class Movie extends Equatable {
  @HiveField(0)
  final int kinopoiskId;
  @HiveField(1)
  final double ratingKinopoisk;
  @HiveField(2)
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

  @override
  List<Object?> get props => [kinopoiskId];
}
