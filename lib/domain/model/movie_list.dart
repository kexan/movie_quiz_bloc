import 'package:equatable/equatable.dart';
import 'package:movie_quiz_bloc/domain/model/movie.dart';

import '../../data/api/model/movielist/api_movie_list.dart';

class MovieList extends Equatable {
  final int totalPages;
  final List<Movie> movies;

  const MovieList({
    required this.totalPages,
    required this.movies,
  });

  factory MovieList.fromApi(ApiMovieList apiMovieList) => MovieList(
        totalPages: apiMovieList.totalPages,
        movies: apiMovieList.items.map((apiMovie) => Movie.fromApi(apiMovie)).toList(),
      );

  @override
  List<Object?> get props => [movies];
}
