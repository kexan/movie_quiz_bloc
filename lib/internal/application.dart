import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_quiz_bloc/domain/repository/movie_repository.dart';
import 'package:movie_quiz_bloc/presentation/bloc/quiz_bloc.dart';

import '../presentation/view/quiz.dart';

class Application extends StatelessWidget {
  final MovieRepository repository;
  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      color: Colors.blue,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  );

  Application({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuizBloc>(
      create: (_) => QuizBloc(repository)..add(QuizInit()),
      child: MaterialApp(
        title: "Quiz",
        home: const Quiz(),
        theme: lightTheme,
      ),
    );
  }
}
