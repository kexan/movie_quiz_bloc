import 'dart:math';

import 'package:movie_quiz_bloc/data/api/api_util.dart';
import 'package:movie_quiz_bloc/data/local/hive_util.dart';
import 'package:movie_quiz_bloc/domain/model/movie.dart';
import 'package:movie_quiz_bloc/domain/model/movie_list.dart';

import '../../domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final ApiUtil apiUtil;
  final HiveUtil hiveUtil;

  MovieRepositoryImpl(this.apiUtil, this.hiveUtil);

  @override
  Future<MovieList> getMovieListFromPage({required int page}) {
    return apiUtil.getMovieList(page: page);
  }

  @override
  Future<MovieList> fetchMoviesFromAllPages() async {
    final movieList = await getMovieListFromPage(page: 1);
    for (var i = 2; i <= movieList.totalPages; i++) {
      final currentPage = await getMovieListFromPage(page: i);
      movieList.movies.addAll(currentPage.movies);
    }
    return movieList;
  }

  @override
  Future<void> prepareMovieList() async {
    try {
      // Сначала пытаемся загрузить данные из Hive
      MovieList? movieList = hiveUtil.getMovieList();
      if (movieList == null) {
        // Если данные отсутствуют в Hive, загружаем их через API
        movieList = await fetchMoviesFromAllPages();
        await hiveUtil.saveMovieList(movieList);
      }
    } catch (e) {
      throw Exception('Failed to prepare movie list: $e');
    }
  }

  @override
  Movie getRandomMovieFromList() {
    MovieList? hiveMovieList = hiveUtil.getMovieList();

    if (hiveMovieList != null) {
      return hiveMovieList.movies[Random().nextInt(hiveMovieList.movies.length)];
    }

    throw Exception('Movie list is not prepared.');
  }
}
