part of 'movie_bloc.dart';

sealed class MovieEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class MovieFetched extends MovieEvent {}
