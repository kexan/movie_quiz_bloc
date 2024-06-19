import 'package:movie_quiz_bloc/data/api/api_util.dart';

import '../../data/api/dataservice/movie_data_service.dart';

class ApiModule {
  static final ApiUtil _apiUtil = ApiUtil(MovieDataService());

  static ApiUtil apiUtil() {
    return _apiUtil;
  }
}
