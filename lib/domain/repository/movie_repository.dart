import '../model/movie.dart';
import '../model/movie_list.dart';

abstract interface class MovieRepository {
  Future<MovieList> getMovieListFromPage({required int page});

  Future<MovieList> prepareMovieList();

  Movie getRandomMovieFromList({required MovieList movieList});
}
