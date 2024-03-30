import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_quiz_bloc/bloc/movie_bloc.dart';
import '../model/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  final int ratingToCompare;

  const MovieItem(
      {super.key, required this.movie, required this.ratingToCompare});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Card(
            elevation: 10,
            margin: const EdgeInsets.all(30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(
                movie.posterUrlPreview,
              ),
            ),
          ),
          SizedBox(
            width: 350,
            child: Text(
              "Рейтинг этого фильма больше чем $ratingToCompare?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
                width: 150,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.red,
                    elevation: 5,
                  ),
                  onPressed: () => BlocProvider.of<MovieBloc>(context)
                      .add(NoButtonPressed()),
                  child: const Text(
                    "Нет",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              SizedBox(
                height: 60,
                width: 150,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.green,
                    elevation: 5,
                  ),
                  onPressed: () => BlocProvider.of<MovieBloc>(context)
                      .add(YesButtonPressed()),
                  child: const Text(
                    "Да",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
