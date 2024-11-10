import 'package:go_router/go_router.dart';
import 'package:piece_of_flutter_animation/src/pages/pages.dart';

GoRouter appRouter = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: HomePage.path,
      name: HomePage.name,
      pageBuilder: (context, state) {
        return const NoTransitionPage<HomePage>(
          child: HomePage(),
        );
      },
    ),
    GoRoute(
      path: TweenPage.path,
      name: TweenPage.name,
      pageBuilder: (context, state) {
        return const NoTransitionPage<TweenPage>(
          child: TweenPage(),
        );
      },
    ),
  ],
);
