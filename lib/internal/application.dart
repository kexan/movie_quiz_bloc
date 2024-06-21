import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_quiz_bloc/domain/repository/movie_repository.dart';
import 'package:movie_quiz_bloc/presentation/bloc/quiz_bloc.dart';

import '../presentation/view/quiz.dart';

class Application extends StatelessWidget {
  final MovieRepository repository;

  const Application({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuizBloc>(
      create: (_) => QuizBloc(repository)..add(QuizInit()),
      child: const MaterialApp(
        title: "Quiz",
        home: Quiz(),
      ),
    );
  }
}
