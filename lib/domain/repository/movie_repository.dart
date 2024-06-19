import '../model/movie_list.dart';

abstract interface class MovieRepository {
  Future<MovieList> getMovieList({required String type, required int page});
}
