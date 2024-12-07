import 'package:piece_of_flutter_animation/src/domain/models/models.dart';
import 'package:piece_of_flutter_animation/src/pages/pages.dart';

final Menu animationBase = Menu(
  title: 'Animation Concepts',
  path: '',
  name: '',
  subMenu: [
    Menu(
      title: TweenPage.title,
      path: TweenPage.path,
      name: '$TweenPage',
    ),
    Menu(
      title: CurvePage.title,
      path: CurvePage.path,
      name: '$CurvePage',
    ),
    Menu(
      title: TickerPage.title,
      path: TickerPage.path,
      name: '$TickerPage',
    ),
    Menu(
      title: CanvasPage.title,
      path: CanvasPage.path,
      name: '$CanvasPage',
    )
  ],
);

const Menu animationSamples = Menu(
  title: 'Animation Samples',
  path: '',
  name: '',
  subMenu: [],
);
