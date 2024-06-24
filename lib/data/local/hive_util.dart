import 'package:movie_quiz_bloc/data/local/datasource/hive_movie_data_source.dart';

import '../../domain/model/movie_list.dart';

class HiveUtil {
  final HiveMovieDataSource hiveMovieDataSource;

  HiveUtil(this.hiveMovieDataSource);

  MovieList? getMovieList()  {
    return hiveMovieDataSource.getMovieList();
  }

  Future<void> saveMovieList(MovieList movieList) async {
    hiveMovieDataSource.saveMovieList(movieList);
  }
}
