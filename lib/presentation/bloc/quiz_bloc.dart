import "dart:math";

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_quiz_bloc/domain/repository/movie_repository.dart';

import '../../domain/model/movie.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final MovieRepository repository;
  int currentRound = 1;

  QuizBloc(this.repository) : super(QuizState()) {
    on<QuizInit>(_onInit);
    on<YesButtonPressed>(_onYesButtonPressed);
    on<NoButtonPressed>(_onNoButtonPressed);
    on<RestartButtonPressed>(_onRestartButtonPressed);
  }

  Future<void> _onInit(event, emit) async {
    try {
      emit(QuizLoadingState());
      await _prepareMovieList();
      return emit(
        QuizFulfilledState(
          movie: _getRandomMovie(),
          ratingToCompare: _getRandomNum(7, 10),
          correctAnswers: 0,
        ),
      );
    } catch (e) {
      emit(QuizErrorState("Failed to fetch movies"));
    }
  }

  void _onYesButtonPressed(event, emit) {
    return _checkAnswer(true, emit);
  }

  void _onNoButtonPressed(event, emit) {
    return _checkAnswer(false, emit);
  }

  void _checkAnswer(bool userAnswer, emit) {
    if (state is QuizFulfilledState) {
      final QuizFulfilledState fulfilledState = state as QuizFulfilledState;
      /*выглядит как хреновый хак, но я чет не допер как красивее получить доступ к
      конкретному стейту без использования freezed в стейте*/

      if (currentRound == 10) {
        emit(QuizEndedState(correctAnswers: fulfilledState.correctAnswers));
        return;
      }

      final bool trueAnswer = fulfilledState.ratingToCompare < fulfilledState.movie.ratingKinopoisk;
      currentRound++;

      if (userAnswer == trueAnswer) {
        emit(
          QuizFulfilledState(
              movie: _getRandomMovie(),
              ratingToCompare: _getRandomNum(7, 10),
              correctAnswers: fulfilledState.correctAnswers + 1),
        );
        return;
      }

      emit(
        QuizFulfilledState(
            movie: _getRandomMovie(),
            ratingToCompare: _getRandomNum(7, 10),
            correctAnswers: fulfilledState.correctAnswers),
      );
    }
  }

  void _onRestartButtonPressed(RestartButtonPressed event, Emitter<QuizState> emit) {
    currentRound = 1;
    emit(
      QuizFulfilledState(
        movie: _getRandomMovie(),
        ratingToCompare: _getRandomNum(7, 10),
        correctAnswers: 0,
      ),
    );
  }

  Movie _getRandomMovie() {
    return repository.getRandomMovieFromList();
  }

  Future<void> _prepareMovieList() async {
    await repository.prepareMovieList();
  }

  int _getRandomNum(int min, int max) => min + Random().nextInt(max - min);
}
