import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_quiz_bloc/bloc/movie_bloc.dart';
import '../model/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie? movie;

  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Card(
            elevation: 10,
            margin: EdgeInsets.all(30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(
                "https://image.openmoviedb.com/kinopoisk-images/1599028/4adf61aa-3cb7-4381-9245-523971e5b4c8/x1000",
                isAntiAlias: true,
              ),
            ),
          ),
          SizedBox(
            width: 350,
            child: const Text(
              "Рейтинг этого фильма меньше чем 9?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
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
                  onPressed: () =>
                      BlocProvider.of<MovieBloc>(context).add(MovieFetched()),
                  child: Text(
                    "Нет",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
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
                  onPressed: () =>
                      BlocProvider.of<MovieBloc>(context).add(MovieFetched()),
                  child: Text(
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
