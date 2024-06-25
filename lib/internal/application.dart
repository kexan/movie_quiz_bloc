import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_quiz_bloc/domain/repository/movie_repository.dart';
import 'package:movie_quiz_bloc/internal/app_router.dart';
import 'package:movie_quiz_bloc/presentation/bloc/quiz/quiz_bloc.dart';

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
      child: MaterialApp.router(
        title: "Quiz",
        theme: lightTheme,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routerDelegate: AppRouter.router.routerDelegate,
      ),
    );
  }
}
