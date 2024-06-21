import '../model/movie.dart';
import '../model/movie_list.dart';

abstract interface class MovieRepository {
  Future<MovieList> getMovieList({required int page});

  Movie getRandomMovieFromList({required MovieList movieList});
}
