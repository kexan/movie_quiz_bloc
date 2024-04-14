import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_quiz_bloc/view/quiz.dart';
import 'package:http/http.dart' as http;

import 'bloc/quiz_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Material(
        child: BlocProvider(
          create: (context) => QuizBloc(httpClient: http.Client())..add(Init()),
          child: MaterialApp(
            home: const Quiz(),
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.green,
                background: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
