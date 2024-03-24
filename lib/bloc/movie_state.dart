part of 'movie_bloc.dart';

enum MovieStatus { initial, success, failure }

final class MovieState extends Equatable {
  final MovieStatus status;
  final Movie? movie;

  const MovieState({
    this.movie,
    this.status = MovieStatus.initial,
  });

  MovieState copyWith({MovieStatus? status, Movie? movie}) {
    return MovieState(
        status: status ?? this.status, movie: movie ?? this.movie);
  }

  @override
  List<Object> get props => [];
}
