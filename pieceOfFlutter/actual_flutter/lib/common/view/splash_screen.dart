import 'dart:io';

import 'package:actual_flutter/common/const/colors.dart';
import 'package:actual_flutter/common/const/data.dart';
import 'package:actual_flutter/common/layout/default_layout.dart';
import 'package:actual_flutter/common/view/root_tab.dart';
import 'package:actual_flutter/user/view/login_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // deleteToken();
    checkToken();
  }

  void checkToken() async {
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final dio = Dio();

    // localhost
    const emulatorIP = '10.0.0.2:3000';
    const simulatorIP = '127.0.0.1:3000';

    final ip = Platform.isAndroid ? emulatorIP : simulatorIP;

    final url = 'http://$ip/auth/token';

    bool isAuthorized = false;

    try {
      final resp = await dio.post(
        url,
        options: Options(
          headers: {
            "authorization": "Bearer $refreshToken",
          },
        ),
      );
      await storage.write(key: ACCESS_TOKEN_KEY, value: resp.data['accessToken']);
      isAuthorized = true;
    } catch (e) {
      isAuthorized = false;
    }

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => isAuthorized ? RootTab() : LoginScreen(),
      ),
      (route) => false,
    );
  }

  void deleteToken() async {
    await storage.deleteAll();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: PRIMARY_COLOR,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/img/logo/logo.png',
              width: MediaQuery.of(context).size.width / 2,
            ),
            const SizedBox(
              height: 16,
            ),
            const CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
