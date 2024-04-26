import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_quiz_bloc/bloc/quiz_bloc.dart';
import 'package:transparent_image/transparent_image.dart';
import '../model/movie.dart';

class QuizItem extends StatelessWidget {
  final Movie movie;
  final int ratingToCompare;
  final int correctAnswers;

  const QuizItem({
    super.key,
    required this.movie,
    required this.ratingToCompare,
    required this.correctAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MoviePhoto(movie: movie),
          Text(
            "Рейтинг этого фильма больше чем $ratingToCompare?",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const ButtonsRow()
        ],
      ),
    );
  }
}

class MoviePhoto extends StatefulWidget {
  final Movie movie;

  const MoviePhoto({
    super.key,
    required this.movie,
  });

  @override
  createState() => _MoviePhotoState();
}

class _MoviePhotoState extends State<MoviePhoto> {
  Color borderColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        elevation: 10,
        margin: const EdgeInsets.all(30),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            strokeAlign: BorderSide.strokeAlignOutside,
            color: borderColor,
            width: 10,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: SizedBox(
          height: 450,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: widget.movie.posterUrlPreview,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final currentState = context.watch<QuizBloc>().state;

    switch (currentState.status) {
      case QuizStatus.yesButtonPressed:
        _startAnimation(Colors.green);
      case QuizStatus.noButtonPressed:
        _startAnimation(Colors.red);
      default:
        _startAnimation(Colors.transparent);
    }
  }

  void _startAnimation(Color color) {

    setState(() {
      borderColor = color;
    });

    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        borderColor = Colors.transparent;
      });
    });
  }
}

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                BlocProvider.of<QuizBloc>(context).add(NoButtonPressed()),
            child: const Text(
              "Нет",
              style: TextStyle(color: Colors.white),
            ),
          ),
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
                BlocProvider.of<QuizBloc>(context).add(YesButtonPressed()),
            child: const Text(
              "Да",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
