import 'dart:async';
import 'dart:math';

class SlackBot {
  SlackBot._();

  static error(String message) {
    print('🤖[SLACK]: 🔴 오류 발생: $message');
  }
}

void main() async {
  await runZonedGuarded(
    () async {
      runApp();
    },
    (Object exception, StackTrace stackTrace) async {
      await SlackBot.error('$exception\n$stackTrace');
    },
  );
}

void runApp() {
  for (int i = 0; i < 10; i++) {
    print('‣ ${i + 1} 회차');

    // Flutter.onError 역할
    try {
      View.pressButton();
    } catch (_) {}
  }
}

class View {
  static void pressButton() {
    print('    🔵[View] 버튼을 누릅니다.');
    try {
      Presenter.onButtonPreseed();
      Widget.toast(warning: false, message: '데이터 처리애 성공했습니다.');
    } catch (_) {
      Widget.toast(warning: true, message: '데이터 처리에 실패했습니다.');
      rethrow;
    }
  }
}

class Widget {
  static void toast({required bool warning, required String message}) {
    print('    ${warning ? "🟠" : "🟢"}[Toast] $message');
  }
}

class Presenter {
  static void onButtonPreseed() {
    Repository.handleData();
  }
}

class Repository {
  static void handleData() {
    print('    🔵[Repository] 데이터를 처리 합니다.');
    int randomInt = Random().nextInt(10);
    if (randomInt % 2 == 0) {
      throw Exception('Error occured on handling data.');
    }
    return;
  }
}
