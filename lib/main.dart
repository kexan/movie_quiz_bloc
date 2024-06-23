import 'package:flutter/material.dart';
import 'package:movie_quiz_bloc/internal/application.dart';

import 'data/local/hive_service.dart';
import 'internal/dependencies/repository_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();

  final repository = RepositoryModule.movieRepository();
  runApp(Application(repository: repository));
}
