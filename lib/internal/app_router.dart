import 'package:go_router/go_router.dart';
import 'package:movie_quiz_bloc/presentation/view/movie_info.dart';

import '../presentation/view/quiz.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Quiz(),
      ),
      GoRoute(
        path: '/movie',
        builder: (context, state) => const MovieInfo(),
      ),
    ],
  );
}
