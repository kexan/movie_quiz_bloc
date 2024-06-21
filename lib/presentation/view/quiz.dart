import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_quiz_bloc/presentation/bloc/quiz_bloc.dart';

import 'widgets/quiz_item.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }
}

_buildBody() {
  return BlocBuilder<QuizBloc, QuizState>(
    builder: (BuildContext context, QuizState state) {
      if (state is QuizInitialState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is QuizLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is QuizFulfilledState) {
        return QuizItem(
          movieList: state.movieList,
          ratingToCompare: 1,
          correctAnswers: 1,
        );
      }
      if (state is QuizErrorState) {
        return const Center(
          child: Text("its not working"),
        );
      }
      return const Center(
        child: Text("its not working"),
      );
    },
  );
}

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<QuizBloc, QuizState>(listener: (context, state) {
//       if (state.status == QuizStatus.quizEnded) {
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return ResultDialog(correctAnswers: state.correctAnswers);
//           },
//         );
//       }
//     }, builder: (context, state) {
//       switch (state.status) {
//         case QuizStatus.initial:
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         case QuizStatus.failure:
//           return const Material(
//             child: Center(
//               child: Text('Не удалось получить фильмы'),
//             ),
//           );
//         default:
//           return QuizItem(
//             movie: state.movieList,
//             ratingToCompare: state.ratingToCompare,
//             correctAnswers: state.correctAnswers,
//           );
//       }
//     });
//   }
// }
