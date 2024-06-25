import 'package:go_router/go_router.dart';

import '../presentation/view/quiz.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Quiz(),
      ),
    ],
  );
}
