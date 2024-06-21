import 'dart:math';

import 'package:movie_quiz_bloc/data/api/api_util.dart';
import 'package:movie_quiz_bloc/domain/model/movie.dart';
import 'package:movie_quiz_bloc/domain/model/movie_list.dart';

import '../../domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final ApiUtil apiUtil;

  MovieRepositoryImpl(this.apiUtil);

  @override
  Future<MovieList> getMovieList({required int page}) {
    return apiUtil.getMovieList(page: page);
  }

  @override
  Movie getRandomMovieFromList({required MovieList movieList}) {
    return movieList.movies[Random().nextInt(movieList.movies.length)];
  }
}
