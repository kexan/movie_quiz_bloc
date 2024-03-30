import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import "dart:math";

import '../model/movie.dart';

part 'movie_event.dart';

part 'movie_state.dart';

const String apiToken = "6624381e-f39e-497f-b02c-9dd0ce8cd08b";

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final http.Client httpClient;

  MovieBloc({required this.httpClient}) : super(const MovieState()) {
    on<InitEvent>(_onInit);
    on<YesButtonPressed>(_onYesButtonPressed);
    on<NoButtonPressed>(_onNoButtonPressed);
  }

  Future<void> _onInit(InitEvent event, Emitter<MovieState> emit) async {
    try {
      final movieList = await _fetchMovieList(page: 1);
      emit(
        state.copyWith(
          movieList: movieList,
        ),
      );
      for (var i = 2; i <= state.movieList.totalPagesCount; i++) {
        final fetchedList = await _fetchMovieList(page: i);
        state.movieList.movies.addAll(fetchedList.movies);
        print("added movies from page $i");
      }
      print("exited loop");
      return emit(state.copyWith(
        status: MovieStatus.success,
        movie: _getRandomMovieFromList(movieList: movieList),
        ratingToCompare: Random().nextInt(10),
      ));
    } catch (_) {
      emit(state.copyWith(status: MovieStatus.failure));
    }
  }

  void _onYesButtonPressed(YesButtonPressed event, Emitter<MovieState> emit) {
    if (_checkAnswer(userAnswer: true)) {
      emit(state.copyWith(correctAnswers: state.correctAnswers + 1));
    }
    return emit(
      state.copyWith(
        movie: _getRandomMovieFromList(movieList: state.movieList),
        ratingToCompare: Random().nextInt(10),
      ),
    );
  }

  void _onNoButtonPressed(NoButtonPressed event, Emitter<MovieState> emit) {
    if (_checkAnswer(userAnswer: false)) {
      emit(state.copyWith(correctAnswers: state.correctAnswers + 1));
    }
    return emit(
      state.copyWith(
        movie: _getRandomMovieFromList(movieList: state.movieList),
        ratingToCompare: Random().nextInt(10),
      ),
    );
  }

  bool _checkAnswer({required bool userAnswer}) {
    final bool trueAnswer = state.ratingToCompare < state.movie.ratingKinopoisk;
    return userAnswer == trueAnswer;
  }

  Future<MovieList> _fetchMovieList({int page = 1}) async {
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
}
