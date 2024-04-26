import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import "dart:math";

import '../model/movie.dart';

part 'quiz_event.dart';

part 'quiz_state.dart';

const String apiToken = "6624381e-f39e-497f-b02c-9dd0ce8cd08b";

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final http.Client httpClient;

  QuizBloc({required this.httpClient}) : super(const QuizState()) {
    on<Init>(_onInit);
    on<YesButtonPressed>(_onYesButtonPressed);
    on<NoButtonPressed>(_onNoButtonPressed);
    on<RestartButtonPressed>(_onRestartButtonPressed);
  }

  Future<void> _onInit(Init event, Emitter<QuizState> emit) async {
    try {
      final movieList = await _fetchMovieList(page: 1);
      emit(
        state.copyWith(
          movieList: movieList,
        ),
      );
      for (var i = 2; i <= state.movieList.totalPagesCount; i++) {
        final movieList = await _fetchMovieList(page: i);
        state.movieList.movies.addAll(movieList.movies);
      }
      return emit(
        state.copyWith(
          status: QuizStatus.quizStarted,
          movie: _getRandomMovieFromList(movieList: movieList),
          ratingToCompare: _getRandomNum(7, 10),
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: QuizStatus.failure));
    }
  }

  void _onYesButtonPressed(YesButtonPressed event, Emitter<QuizState> emit) {
    emit(state.copyWith(status: QuizStatus.yesButtonPressed));
    return _checkAnswer(true, emit);
  }

  void _onNoButtonPressed(NoButtonPressed event, Emitter<QuizState> emit) {
    emit(state.copyWith(status: QuizStatus.noButtonPressed));
    return _checkAnswer(false, emit);
  }

  void _onRestartButtonPressed(
      RestartButtonPressed event, Emitter<QuizState> emit) {
    return emit(
      state.copyWith(
        status: QuizStatus.quizStarted,
        movie: _getRandomMovieFromList(movieList: state.movieList),
        currentRound: 0,
        correctAnswers: 0,
      ),
    );
  }

  void _onQuizEnded(Emitter<QuizState> emit) {
    return emit(state.copyWith(status: QuizStatus.quizEnded));
  }

  void _checkAnswer(bool userAnswer, Emitter<QuizState> emit) {
    final bool trueAnswer = state.ratingToCompare < state.movie.ratingKinopoisk;
    if (userAnswer == trueAnswer) {
      emit(
        state.copyWith(
          correctAnswers: state.correctAnswers + 1,
        ),
      );
    }
    if (state.currentRound == 9) {
      _onQuizEnded(emit);
      return;
    }
    emit(
      state.copyWith(
        movie: _getRandomMovieFromList(movieList: state.movieList),
        ratingToCompare: _getRandomNum(7, 10),
        currentRound: state.currentRound + 1,
      ),
    );
  }

  Future<MovieList> _fetchMovieList({required int page}) async {
    final response = await httpClient.get(
      Uri(
        host: "kinopoiskapiunofficial.tech",
        path: "/api/v2.2/films/collections",
        scheme: "https",
        queryParameters: {
          "type": "TOP_250_MOVIES",
          "page": page.toString(),
        },
      ),
      headers: {
        "X-API-KEY": apiToken,
      },
    );
    if (response.statusCode == 200) {
      return MovieList.fromJson(response.body);
    }
    throw Exception("fetching error");
  }

  Movie _getRandomMovieFromList({required MovieList movieList}) {
    return movieList.movies[Random().nextInt(movieList.movies.length)];
  }

  int _getRandomNum(int min, int max) => min + Random().nextInt(max - min);
}
