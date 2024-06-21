part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  @override
  List<Object> get props => [];
}

class QuizInitialState extends QuizState {}

class QuizLoadingState extends QuizState {}

class QuizFulfilledState extends QuizState {
  final MovieList movieList;

  QuizFulfilledState(this.movieList);

  @override
  List<Object> get props => [movieList];
}

class QuizErrorState extends QuizState {
  final String message;

  QuizErrorState(this.message);

  @override
  List<Object> get props => [message];
}

//
// final class QuizState extends Equatable {
//   final QuizStatus status;
//   final MovieList movieList;
//   final Movie movie;
//   final int ratingToCompare;
//   final int correctAnswers;
//   final int currentRound;
//
//   const QuizState({
//     this.movieList = const MovieList(
//       movies: <Movie>[],
//       totalPages: 1,
//     ),
//     this.movie = const Movie(
//       kinopoiskId: 1,
//       ratingKinopoisk: 1,
//       posterUrlPreview: "posterUrlPreview",
//     ),
//     this.status = QuizStatus.initial,
//     this.correctAnswers = 0,
//     this.ratingToCompare = 0,
//     this.currentRound = 0,
//   });
//
//   QuizState copyWith({
//     QuizStatus? status,
//     MovieList? movieList,
//     Movie? movie,
//     int? correctAnswers,
//     int? ratingToCompare,
//     int? currentRound,
//   }) {
//     return QuizState(
//       status: status ?? this.status,
//       movieList: movieList ?? this.movieList,
//       movie: movie ?? this.movie,
//       correctAnswers: correctAnswers ?? this.correctAnswers,
//       ratingToCompare: ratingToCompare ?? this.ratingToCompare,
//       currentRound: currentRound ?? this.currentRound,
//     );
//   }
//
//   @override
//   List<Object> get props => [
//         movie,
//         movieList,
//         status,
//         ratingToCompare,
//         correctAnswers,
//         currentRound,
//       ];
// }
