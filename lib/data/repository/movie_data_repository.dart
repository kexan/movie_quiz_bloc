import 'package:movie_quiz_bloc/data/api/api_util.dart';
import 'package:movie_quiz_bloc/domain/model/movie_list.dart';

import '../../domain/repository/movie_repository.dart';

class MovieDataRepository implements MovieRepository {
  final ApiUtil apiUtil;

  MovieDataRepository(this.apiUtil);

  @override
  Future<MovieList> getMovieList({required String type, required int page}) {
    return apiUtil.getMovieList(type: type, page: page);
  }
}
