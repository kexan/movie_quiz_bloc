import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../movie/api_movie.dart';

part 'api_movie_list.freezed.dart';
part 'api_movie_list.g.dart';

ApiMovieList apiMovieListFromJson(String str) =>
    ApiMovieList.fromJson(json.decode(str));

String apiMovieListToJson(ApiMovieList data) => json.encode(data.toJson());

@freezed
class ApiMovieList with _$ApiMovieList {
  const factory ApiMovieList({
    required int total,
    required int totalPages,
    required List<ApiMovie> items,
  }) = _ApiMovieList;

  factory ApiMovieList.fromJson(Map<String, dynamic> json) =>
      _$ApiMovieListFromJson(json);
}
