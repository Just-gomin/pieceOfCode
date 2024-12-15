import 'package:piece_of_flutter_animation/src/domain/models/models.dart';
import 'package:piece_of_flutter_animation/src/pages/pages.dart';

final NavigationMenu animationBase = NavigationMenu(
  title: 'Animation Concepts',
  path: '',
  name: '',
  menuItem: <NavigationMenu>[
    NavigationMenu(
      title: TweenPage.title,
      path: TweenPage.path,
      name: '$TweenPage',
      menuItem: null,
    ),
    NavigationMenu(
      title: CurvePage.title,
      path: CurvePage.path,
      name: '$CurvePage',
      menuItem: null,
    ),
    NavigationMenu(
      title: TickerPage.title,
      path: TickerPage.path,
      name: '$TickerPage',
      menuItem: null,
    ),
    NavigationMenu(
      title: CanvasPage.title,
      path: CanvasPage.path,
      name: '$CanvasPage',
      menuItem: null,
    )
  ],
);

const NavigationMenu animationSamples = NavigationMenu(
  title: 'Animation Samples',
  path: '',
  name: '',
  menuItem: [],
);
