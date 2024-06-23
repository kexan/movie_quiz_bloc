part of 'quiz_bloc.dart';

class QuizState extends Equatable {
  @override
  List<Object> get props => [];
}

class QuizInitialState extends QuizState {}

class QuizLoadingState extends QuizState {}

class QuizFulfilledState extends QuizState {
  final Movie movie;
  final int ratingToCompare;
  final int correctAnswers;

  QuizFulfilledState({
    this.movie = const Movie(
      kinopoiskId: 1,
      ratingKinopoisk: 1,
      posterUrlPreview: "image URL",
    ),
    this.ratingToCompare = 0,
    this.correctAnswers = 0,
  });

  @override
  List<Object> get props => [movie];
}

class QuizEndedState extends QuizState {
  final int correctAnswers;

  QuizEndedState({required this.correctAnswers});

  @override
  List<Object> get props => [correctAnswers];
}

class QuizErrorState extends QuizState {
  final String message;

  QuizErrorState(this.message);

  @override
  List<Object> get props => [message];
}
