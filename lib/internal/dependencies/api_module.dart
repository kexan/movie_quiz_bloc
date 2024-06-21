import 'package:movie_quiz_bloc/data/api/api_util.dart';
import 'package:movie_quiz_bloc/data/api/datasource/movie_data_source.dart';

class ApiModule {
  static final ApiUtil _apiUtil = ApiUtil(MovieDataSource());

  static ApiUtil apiUtil() {
    return _apiUtil;
  }
}
