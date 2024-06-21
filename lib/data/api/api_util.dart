import 'package:movie_quiz_bloc/data/api/datasource/movie_data_source.dart';
import 'package:movie_quiz_bloc/domain/model/movie_list.dart';

class ApiUtil {
  final MovieDataSource dataSource;

  ApiUtil(this.dataSource);

  Future<MovieList> getMovieList({required int page}) async {
    final result = await dataSource.getMovieListFromApi(page: page);
    print(result);
    return MovieList.fromApi(result);
  }
}
