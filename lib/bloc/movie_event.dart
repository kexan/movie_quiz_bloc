part of 'movie_bloc.dart';

sealed class MovieEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class InitEvent extends MovieEvent {}

final class NoButtonPressed extends MovieEvent {}

final class YesButtonPressed extends MovieEvent {}

final class QuizEnded extends MovieEvent {}
