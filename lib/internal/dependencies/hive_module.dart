import 'package:movie_quiz_bloc/data/local/datasource/hive_movie_data_source.dart';
import 'package:movie_quiz_bloc/data/local/hive_util.dart';

class HiveModule {
  static final HiveUtil _hiveUtil = HiveUtil(HiveMovieDataSource());

  static HiveUtil hiveUtil() {
    return _hiveUtil;
  }
}
