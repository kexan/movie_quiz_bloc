import 'package:flutter/material.dart';
import 'package:movie_quiz_bloc/internal/application.dart';

import 'internal/dependencies/repository_module.dart';

void main() {
  final repository = RepositoryModule.movieRepository();

  runApp(Application(repository: repository));
}
