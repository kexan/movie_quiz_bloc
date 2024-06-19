import 'package:movie_quiz_bloc/data/api/request/get_movie_list_body.dart';
import 'package:movie_quiz_bloc/domain/model/movie_list.dart';

import 'dataservice/movie_data_service.dart';

class ApiUtil {
  final MovieDataService dataService;

  ApiUtil(this.dataService);

  Future<MovieList> getMovieList(
      {required String type, required int page}) async {
    final body = GetMovieListBody(type, page);
    final result = await dataService.getMovieList(body: body);
    return MovieList.fromApi(result);
  }
}
