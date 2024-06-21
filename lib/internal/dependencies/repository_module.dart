import 'package:movie_quiz_bloc/domain/repository/movie_repository.dart';
import 'package:movie_quiz_bloc/internal/dependencies/api_module.dart';

import '../../data/repository/movie_repository_impl.dart';

class RepositoryModule {
  static final MovieRepository _movieRepository =
      MovieRepositoryImpl(ApiModule.apiUtil());

  static MovieRepository movieRepository() {
    return _movieRepository;
  }
}
