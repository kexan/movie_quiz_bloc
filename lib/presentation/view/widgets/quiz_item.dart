import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../domain/model/movie.dart';
import '../../bloc/quiz_bloc.dart';

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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MoviePhoto(urlPreview: movie.posterUrlPreview),
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
  final String urlPreview;

  const MoviePhoto({
    super.key,
    required this.urlPreview,
  });

  @override
  createState() => _MoviePhotoState();
}

class _MoviePhotoState extends State<MoviePhoto> {
  Color borderColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Card(
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
            image: widget.urlPreview,
          ),
        ),
      ),
    );
  }
}

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtonWidget(
              onPressed: () => context.read<QuizBloc>().add(NoButtonPressed()),
              text: "Нет",
              color: Colors.red,
            ),
            ButtonWidget(
              onPressed: () => context.read<QuizBloc>().add(YesButtonPressed()),
              text: "Да",
              color: Colors.green,
            ),
          ],
        );
      },
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;

  const ButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 150,
      child: FilledButton(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: color,
          elevation: 5,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

// @override
// void didChangeDependencies() {
//   super.didChangeDependencies();
//   final currentState = context.watch<QuizBloc>().state;
//
//   switch (currentState.status) {
//     case QuizStatus.yesButtonPressed:
//       _startAnimation(Colors.green);
//     case QuizStatus.noButtonPressed:
//       _startAnimation(Colors.red);
//     default:
//       _startAnimation(Colors.transparent);
//   }
// }
//
// void _startAnimation(Color color) {
//   setState(() {
//     borderColor = color;
//   });
//
//   Future.delayed(const Duration(milliseconds: 400), () {
//     setState(() {
//       borderColor = Colors.transparent;
//     });
//   });
// }
