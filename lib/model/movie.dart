import 'dart:convert';

import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int kinopoiskId;
  final String? imdbId;
  final String nameRu;
  final dynamic nameEn;
  final String? nameOriginal;
  final double ratingKinopoisk;
  final double? ratingImdb;
  final int year;
  final String posterUrl;
  final String posterUrlPreview;

  const Movie({
    required this.kinopoiskId,
    required this.imdbId,
    required this.nameRu,
    required this.nameEn,
    required this.nameOriginal,
    required this.ratingKinopoisk,
    required this.ratingImdb,
    required this.year,
    required this.posterUrl,
    required this.posterUrlPreview,
  });

  Movie copyWith({
    int? kinopoiskId,
    String? imdbId,
    String? nameRu,
    dynamic nameEn,
    String? nameOriginal,
    double? ratingKinopoisk,
    double? ratingImdb,
    int? year,
    Type? type,
    String? posterUrl,
    String? posterUrlPreview,
  }) =>
      Movie(
        kinopoiskId: kinopoiskId ?? this.kinopoiskId,
        imdbId: imdbId ?? this.imdbId,
        nameRu: nameRu ?? this.nameRu,
        nameEn: nameEn ?? this.nameEn,
        nameOriginal: nameOriginal ?? this.nameOriginal,
        ratingKinopoisk: ratingKinopoisk ?? this.ratingKinopoisk,
        ratingImdb: ratingImdb ?? this.ratingImdb,
        year: year ?? this.year,
        posterUrl: posterUrl ?? this.posterUrl,
        posterUrlPreview: posterUrlPreview ?? this.posterUrlPreview,
      );

  factory Movie.fromJson(String str) => Movie.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Movie.fromMap(Map<String, dynamic> json) => Movie(
        kinopoiskId: json["kinopoiskId"],
        imdbId: json["imdbId"],
        nameRu: json["nameRu"],
        nameEn: json["nameEn"],
        nameOriginal: json["nameOriginal"],
        ratingKinopoisk: json["ratingKinopoisk"]?.toDouble(),
        ratingImdb: json["ratingImdb"]?.toDouble(),
        year: json["year"],
        posterUrl: json["posterUrl"],
        posterUrlPreview: json["posterUrlPreview"],
      );

  Map<String, dynamic> toMap() => {
        "kinopoiskId": kinopoiskId,
        "imdbId": imdbId,
        "nameRu": nameRu,
        "nameEn": nameEn,
        "nameOriginal": nameOriginal,
        "ratingKinopoisk": ratingKinopoisk,
        "ratingImdb": ratingImdb,
        "year": year,
        "posterUrl": posterUrl,
        "posterUrlPreview": posterUrlPreview,
      };

  @override
  List<Object?> get props => [kinopoiskId];
}

class MovieList {
  final int totalPagesCount;
  final List<Movie> movies;

  const MovieList({
    required this.totalPagesCount,
    required this.movies,
  });

  MovieList copyWith({
    int? currentPage,
    int? totalPagesCount,
    List<Movie>? movies,
  }) =>
      MovieList(
        totalPagesCount: totalPagesCount ?? this.totalPagesCount,
        movies: movies ?? this.movies,
      );

  factory MovieList.fromJson(String str) => MovieList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MovieList.fromMap(Map<String, dynamic> json) => MovieList(
        totalPagesCount: json["totalPages"],
        movies: List<Movie>.from(
          json["items"].map(
            (x) => Movie.fromMap(x),
          ),
        ),
      );

  Map<String, dynamic> toMap() => {
        "totalPages": totalPagesCount,
        "items": List<dynamic>.from(movies.map((x) => x.toMap())),
      };
}
