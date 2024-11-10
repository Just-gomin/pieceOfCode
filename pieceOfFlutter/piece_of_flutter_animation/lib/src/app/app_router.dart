import 'package:go_router/go_router.dart';
import 'package:piece_of_flutter_animation/src/app/menu_tree.dart';
import 'package:piece_of_flutter_animation/src/pages/pages.dart';

GoRouter appRouter = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: HomePage.path,
      name: HomePage.name,
      pageBuilder: (context, state) {
        return NoTransitionPage<HomePage>(
          child: HomePage(
            menuList: [
              animationBase,
              animationSamples,
            ],
          ),
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
    GoRoute(
      path: CurvePage.path,
      name: CurvePage.name,
      pageBuilder: (context, state) {
        return const NoTransitionPage<CurvePage>(
          child: CurvePage(),
        );
      },
    ),
  ],
);
