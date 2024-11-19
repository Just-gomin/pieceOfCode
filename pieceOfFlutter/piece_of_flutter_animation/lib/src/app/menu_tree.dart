import 'package:piece_of_flutter_animation/src/domain/models/models.dart';
import 'package:piece_of_flutter_animation/src/pages/pages.dart';

final Menu animationBase = Menu(
  title: 'Animation Concepts',
  subMenu: [
    Menu(
      title: TweenPage.title,
      path: TweenPage.path,
    ),
    Menu(
      title: CurvePage.title,
      path: CurvePage.path,
    ),
    Menu(
      title: TickerPage.title,
      path: TickerPage.path,
    ),
    Menu(
      title: CanvasPage.title,
      path: CanvasPage.path,
    )
  ],
);

const Menu animationSamples = Menu(
  title: 'Animation Samples',
  subMenu: [],
);
