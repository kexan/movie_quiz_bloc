import '../../../domain/model/movie_list.dart';
import '../hive_boxes/movie_box.dart';

class HiveMovieDataSource {
  MovieList? getMovieList() {
    final box = MovieBox.getBox();

    if (box.isEmpty) {
      return null;
    }

    final movies = box.values.toList();
    return MovieList(movies: movies, totalPages: 1);
  }

  Future<void> saveMovieList(MovieList movieList) async {
    final box = MovieBox.getBox();
    for (var movie in movieList.movies) {
      await box.put(movie.kinopoiskId, movie);
    }
  }
}
