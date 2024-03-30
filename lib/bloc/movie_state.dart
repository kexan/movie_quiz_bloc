part of 'movie_bloc.dart';

enum MovieStatus { initial, success, failure }

final class MovieState extends Equatable {
  final MovieStatus status;
  final MovieList movieList;
  final Movie movie;
  final int ratingToCompare;
  final int correctAnswers;

  const MovieState({
    this.movieList = const MovieList(
      movies: <Movie>[],
      totalPagesCount: 0,
    ),
    this.movie = const Movie(
      kinopoiskId: 1,
      imdbId: "1",
      nameRu: "nameRu",
      nameEn: "nameEn",
      nameOriginal: "nameOriginal",
      ratingKinopoisk: 1,
      ratingImdb: 1,
      year: 1,
      posterUrl: "posterUrl",
      posterUrlPreview: "posterUrlPreview",
    ),
    this.status = MovieStatus.initial,
    this.correctAnswers = 0,
    this.ratingToCompare = 0,
  });

  MovieState copyWith({
    MovieStatus? status,
    MovieList? movieList,
    Movie? movie,
    int? correctAnswers,
    int? ratingToCompare,
  }) {
    return MovieState(
      status: status ?? this.status,
      movieList: movieList ?? this.movieList,
      movie: movie ?? this.movie,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      ratingToCompare: ratingToCompare ?? this.ratingToCompare,
    );
  }

  @override
  List<Object> get props => [movie, movieList, status];
}
