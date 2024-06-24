import '../model/movie.dart';
import '../model/movie_list.dart';

abstract interface class MovieRepository {
  Future<MovieList> getMovieListFromPage({required int page});

  Future<MovieList> fetchMoviesFromAllPages();

  Future<void> prepareMovieList();

  Movie getRandomMovieFromList();
}
