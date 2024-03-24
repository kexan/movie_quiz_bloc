import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:movie_quiz_bloc/model/poster.dart';
import 'package:movie_quiz_bloc/model/rating.dart';

import '../model/movie.dart';

part 'movie_event.dart';

part 'movie_state.dart';

const String apiToken = "8CTYG4C-MJGMVV8-P7G5997-CD8T22P";

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final http.Client httpClient;

  MovieBloc({required this.httpClient}) : super(const MovieState()) {
    on<MovieFetched>(_onMovieFetched);
  }

  Future<void> _onMovieFetched(
      MovieFetched event, Emitter<MovieState> emit) async {
    try {
      final movie = Movie();
      print("onmoviefetched");
      // final movie = await _fetchRandomMovie(); шо бы не тратить запросы
      return emit(state.copyWith(movie: movie, status: MovieStatus.success));
    } catch (_) {
      emit(state.copyWith(status: MovieStatus.failure));
    }
  }

  Future<Movie> _fetchRandomMovie() async {
    final response = await httpClient.get(
        Uri(
          host: "api.kinopoisk.dev",
          path: "/v1.4/movie/random",
          scheme: "https",
          queryParameters: {"lists": "top250"},
        ),
        headers: {"X-API-KEY": apiToken});
    if (response.statusCode == 200) {
      print(response.body);
      final movie = Movie.fromJson(response.body);
      print(movie.poster?.previewUrl);
      return movie;
    }
    throw Exception("fetching error");
  }
}
