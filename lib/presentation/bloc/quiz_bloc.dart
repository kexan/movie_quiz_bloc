import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_quiz_bloc/domain/repository/movie_repository.dart';
import "dart:math";

import '../../domain/model/movie_list.dart';

part 'quiz_event.dart';

part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final MovieRepository repository;

  QuizBloc(this.repository) : super(QuizInitialState()) {
    on<QuizInit>(_onInit);
    // on<YesButtonPressed>(_onYesButtonPressed);
    // on<NoButtonPressed>(_onNoButtonPressed);
    // on<RestartButtonPressed>(_onRestartButtonPressed);
  }

  Future<void> _onInit(QuizInit event, Emitter<QuizState> emit) async {
    try {
      emit(QuizLoadingState());
      print("loading");
      final movieList = await repository.getMovieList(
          page: 1); //загружаем первую страницу top250
      print("first load");
      print(movieList);
      for (var i = 2; i <= movieList.totalPages; i++) {
        final _movieList = await repository.getMovieList(page: i);
        movieList.movies.addAll(_movieList.movies);
      } //загружаем все остальные страницы top250, после того, как узнаем сколько всего там страниц
      print("second load");
      emit(QuizFulfilledState(movieList));
    } catch (e) {
      emit(QuizErrorState("Failed to fetch movies"));
      print(e.toString());
    }
  }
}

//   void _checkAnswer(bool userAnswer, Emitter<QuizState> emit) {
//     final bool trueAnswer =
//         state.ratingToCompare < state.movieList.ratingKinopoisk;
//     if (userAnswer == trueAnswer) {
//       emit(
//         state.copyWith(
//           correctAnswers: state.correctAnswers + 1,
//         ),
//       );
//     }
//     if (state.currentRound >= 9) {
//       _onQuizEnded(emit);
//       return;
//     }
//     emit(
//       state.copyWith(
//         movieList: _getRandomMovieFromList(movieList: state.movieList),
//         ratingToCompare: _getRandomNum(7, 10),
//         currentRound: state.currentRound + 1,
//       ),
//     );
//   }
// }
//
// void _onYesButtonPressed(YesButtonPressed event, Emitter<QuizState> emit) {
//   emit(state.copyWith(status: QuizStatus.yesButtonPressed));
//   return _checkAnswer(true, emit);
// }
//
// void _onNoButtonPressed(NoButtonPressed event, Emitter<QuizState> emit) {
//   emit(state.copyWith(status: QuizStatus.noButtonPressed));
//   return _checkAnswer(false, emit);
// }
//
// void _onRestartButtonPressed(
//     RestartButtonPressed event, Emitter<QuizState> emit) {
//   return emit(
//     state.copyWith(
//       status: QuizStatus.quizStarted,
//       movieList: _getRandomMovieFromList(movieList: state.movieList),
//       currentRound: 0,
//       correctAnswers: 0,
//     ),
//   );
// }
//
// void _onQuizEnded(Emitter<QuizState> emit) {
//   return emit(state.copyWith(status: QuizStatus.quizEnded));
// }

// int _getRandomNum(int min, int max) => min + Random().nextInt(max - min);
