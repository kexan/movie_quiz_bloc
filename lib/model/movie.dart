import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:movie_quiz_bloc/model/poster.dart';
import 'package:movie_quiz_bloc/model/rating.dart';

class Movie {
  int? id;
  String? name;
  String? description;
  Rating? rating;
  Poster? poster;

  Movie({this.id, this.name, this.rating, this.description, this.poster});

  Movie copyWith({
    int? id,
    String? name,
    Rating? rating,
    String? description,
    Poster? poster,
  }) =>
      Movie(
        id: id ?? this.id,
        name: name ?? this.name,
        rating: rating ?? this.rating,
        description: description ?? this.description,
        poster: poster ?? this.poster,
      );

  factory Movie.fromJson(String str) => Movie.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Movie.fromMap(Map<String, dynamic> json) => Movie(
        id: json["id"],
        name: json["name"],
        rating: Rating.fromMap(json["rating"]),
        description: json["description"],
        poster: Poster.fromMap(json["poster"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "rating": rating?.toMap(),
        "description": description,
        "poster": poster?.toMap(),
      };
}
