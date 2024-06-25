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
  @HiveField(3)
  final String? nameRu;
  @HiveField(4)
  final int? year;
  @HiveField(5)
  final String? description;

  const Movie({
    required this.kinopoiskId,
    required this.ratingKinopoisk,
    required this.posterUrlPreview,
    required this.nameRu,
    required this.year,
    required this.description,
  });

  factory Movie.fromApi(ApiMovie apiMovie) => Movie(
        kinopoiskId: apiMovie.kinopoiskId,
        ratingKinopoisk: apiMovie.ratingKinopoisk,
        posterUrlPreview: apiMovie.posterUrlPreview,
        nameRu: apiMovie.nameRu ?? "У фильма нет названия на русском",
        year: apiMovie.year ?? 0,
        description: apiMovie.description ?? "У фильма нет описания",
      );

  @override
  List<Object?> get props => [kinopoiskId];
}
