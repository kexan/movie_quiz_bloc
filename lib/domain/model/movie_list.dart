import 'package:movie_quiz_bloc/domain/model/movie.dart';
import '../../data/api/api_movie_list.dart';

class MovieList {
  final int totalPages;
  final List<Movie> movies;

  const MovieList({
    required this.totalPages,
    required this.movies,
  });

  MovieList copyWith({
    int? currentPage,
    int? totalPages,
    List<Movie>? movies,
  }) =>
      MovieList(
        totalPages: totalPages ?? this.totalPages,
        movies: movies ?? this.movies,
      );

  factory MovieList.fromApi(ApiMovieList apiMovieList) => MovieList(
        totalPages: apiMovieList.totalPages,
        movies: apiMovieList.items
            .map((apiMovie) => Movie.fromApi(apiMovie))
            .toList(),
      );
}
