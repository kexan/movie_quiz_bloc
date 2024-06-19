import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'api_movie.freezed.dart';
part 'api_movie.g.dart';

ApiMovie apiMovieFromJson(String str) => ApiMovie.fromJson(json.decode(str));

String apiMovieToJson(ApiMovie data) => json.encode(data.toJson());

@freezed
class ApiMovie with _$ApiMovie {
  const factory ApiMovie({
    required int kinopoiskId,
    required String? kinopoiskHdId,
    required String? imdbId,
    required String? nameRu,
    required String? nameEn,
    required String? nameOriginal,
    required String posterUrl,
    required String posterUrlPreview,
    required String? coverUrl,
    required String? logoUrl,
    required int reviewsCount,
    required double? ratingGoodReview,
    required int? ratingGoodReviewVoteCount,
    required double? ratingKinopoisk,
    required int? ratingKinopoiskVoteCount,
    required double? ratingImdb,
    required int? ratingImdbVoteCount,
    required double? ratingFilmCritics,
    required int? ratingFilmCriticsVoteCount,
    required double? ratingAwait,
    required int? ratingAwaitCount,
    required double? ratingRfCritics,
    required int? ratingRfCriticsVoteCount,
    required String? webUrl,
    required int? year,
    required int? filmLength,
    required String? slogan,
    required String? description,
    required String? shortDescription,
    required String? editorAnnotation,
    required bool isTicketsAvailable,
    required String? productionStatus,
    required String? type,
    required String? ratingMpaa,
    required String? ratingAgeLimits,
    required bool? hasImax,
    required bool? has3D,
    required DateTime lastSync,
    required List<Country> countries,
    required List<Genre> genres,
    required int? startYear,
    required int? endYear,
    required bool? serial,
    required bool? shortFilm,
    required bool? completed,
  }) = _ApiMovie;

  factory ApiMovie.fromJson(Map<String, dynamic> json) =>
      _$ApiMovieFromJson(json);
}

@freezed
class Country with _$Country {
  const factory Country({
    required String country,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}

@freezed
class Genre with _$Genre {
  const factory Genre({
    required String genre,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}
