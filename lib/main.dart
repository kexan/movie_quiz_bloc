import 'package:flutter/material.dart';
import 'package:movie_quiz_bloc/app.dart';
import 'package:movie_quiz_bloc/bloc/quiz_bloc.dart';

import 'package:http/http.dart' as http;

import 'model/movie.dart';

void main() {
  runApp(const App());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
