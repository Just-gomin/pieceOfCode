import 'dart:async';
import 'dart:math';

import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';

class SlackBot {
  void sendMessage(Object message) {
    // ignore: avoid_print
    print('🤖[SLACK]$message');
  }

  void error(Object message) => sendMessage('🔴 오류 발생: $message');
}

void main() {
  final SlackBot slackBot = SlackBot();
  runZonedGuarded(
    () async {
      FlutterError.onError = (FlutterErrorDetails errorDetails) {
        final Object exception = errorDetails.exception;
        final StackTrace? stackTrace = errorDetails.stack;
        slackBot.error('[FlutterError] $exception\n$stackTrace');
      };
      runApp(const MyApp());
    },
    (Object exception, StackTrace stackTrace) {
      slackBot.error('[runZoneGuarded] $exception\n$stackTrace');
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomePageController controller = HomePageController();

  @override
  Widget build(BuildContext context) {
    return HomePageMobileView(controller: controller);
  }
}

class HomePageMobileView extends StatelessWidget {
  const HomePageMobileView({
    super.key,
    required this.controller,
  });

  final HomePageController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await controller.riskyOperation(context);
          },
          child: Text('Button'),
        ),
      ),
    );
  }
}

class HomePageController {
  final Repository repository = Repository();

  Future<int> riskyOperation(BuildContext context) async {
    int result;
    try {
      result = repository.handleData();
      if (context.mounted) {
        DelightToastBar(
          builder: (context) => ToastCard(
            leading: Icon(Icons.check_circle, size: 28),
            color: Colors.lightGreen[200],
            title: Text("성공"),
          ),
          autoDismiss: true,
        ).show(context);
      }
    } catch (e) {
      if (context.mounted) {
        DelightToastBar(
          builder: (context) => ToastCard(
            leading: Icon(Icons.error, size: 28),
            color: Colors.red[200],
            title: Text("실패!"),
          ),
          autoDismiss: true,
        ).show(context);
      }
      rethrow;
    }
    return result;
  }
}

class Repository {
  int handleData() {
    int randomInt = Random().nextInt(10);
    if (randomInt % 2 == 0) {
      throw Exception('❗️Error occured on riskyOperation.');
    }
    return randomInt;
  }
}
