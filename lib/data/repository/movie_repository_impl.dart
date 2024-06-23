import 'dart:math';

import 'package:movie_quiz_bloc/data/api/api_util.dart';
import 'package:movie_quiz_bloc/domain/model/movie.dart';
import 'package:movie_quiz_bloc/domain/model/movie_list.dart';

import '../../domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final ApiUtil apiUtil;

  MovieRepositoryImpl(this.apiUtil);

  @override
  Future<MovieList> getMovieListFromPage({required int page}) {
    return apiUtil.getMovieList(page: page);
  }

  @override
  Future<MovieList> prepareMovieList() async {
    final movieList = await getMovieListFromPage(page: 1);
    for (var i = 2; i <= movieList.totalPages; i++) {
      final _ = await getMovieListFromPage(page: i);
      movieList.movies.addAll(_.movies);
    }
    return movieList;
  }

  @override
  Movie getRandomMovieFromList({required MovieList movieList}) {
    return movieList.movies[Random().nextInt(movieList.movies.length)];
  }
}
