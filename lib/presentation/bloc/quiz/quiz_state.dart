part of 'quiz_bloc.dart';

sealed class QuizState extends Equatable {
  @override
  List<Object> get props => [];
}

final class QuizInitialState extends QuizState {}

final class QuizLoadingState extends QuizState {}

final class QuizFulfilledState extends QuizState {
  final Movie movie;
  final int ratingToCompare;
  final int correctAnswers;

  QuizFulfilledState({
    this.movie = const Movie(
      kinopoiskId: 1,
      ratingKinopoisk: 1,
      posterUrlPreview: "image URL",
      nameRu: "name",
      year: 1,
      description: "description",
    ),
    this.ratingToCompare = 0,
    this.correctAnswers = 0,
  });

  @override
  List<Object> get props => [movie];
}

final class QuizEndedState extends QuizState {
  final int correctAnswers;

  QuizEndedState({required this.correctAnswers});

  @override
  List<Object> get props => [correctAnswers];
}

final class QuizErrorState extends QuizState {
  final String message;

  QuizErrorState(this.message);

  @override
  List<Object> get props => [message];
}
