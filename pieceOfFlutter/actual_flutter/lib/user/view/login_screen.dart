import 'dart:convert';
import 'dart:io';

import 'package:actual_flutter/common/component/custom_text_form_field.dart';
import 'package:actual_flutter/common/const/colors.dart';
import 'package:actual_flutter/common/const/data.dart';
import 'package:actual_flutter/common/layout/default_layout.dart';
import 'package:actual_flutter/common/view/root_tab.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    final dio = Dio();

    // localhost
    const emulatorIP = '10.0.0.2:3000';
    const simulatorIP = '127.0.0.1:3000';

    final ip = Platform.isAndroid ? emulatorIP : simulatorIP;

    return DefaultLayout(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          top: true,
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _Title(),
                const SizedBox(height: 16.0),
                const _SubTitle(),
                Image.asset(
                  'asset/img/misc/logo.png',
                  width: MediaQuery.of(context).size.width / 3 * 2,
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField(
                  hintText: "이메일을 입력해주세요",
                  obscureText: false,
                  onChanged: (String value) {
                    username = value;
                  },
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField(
                  hintText: "비밀번호를 입력해주세요",
                  onChanged: (String value) {
                    password = value;
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    // ID:비밀번호 문자열
                    String rawString = '$username:$password';

                    Codec<String, String> stringToBase64 = utf8.fuse(base64);
                    String token = stringToBase64.encode(rawString);

                    final url = 'http://$ip/auth/login';

                    try {
                      final resp = await dio.post(
                        url,
                        options: Options(
                          headers: {
                            "authorization": "Basic $token",
                          },
                        ),
                      );

                      final accesseToken = resp.data['accessToken'];
                      final refreshToken = resp.data['refreshToken'];

                      await storage.write(key: ACCESS_TOKEN_KEY, value: accesseToken);
                      await storage.write(key: REFRESH_TOKEN_KEY, value: refreshToken);

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const RootTab(),
                        ),
                      );
                    } catch (e) {
                      print(e);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PRIMARY_COLOR,
                  ),
                  child: const Text(
                    '로그인',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                  ),
                  child: const Text(
                    '회원가입',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "환영합니다!",
      style: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    );
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "이메일과 비밀번호를 입력해서 로그인 해주세요!\n오늘도 성공적인 주문이 되길:)",
      style: TextStyle(
        fontSize: 16,
        color: BODY_TEXT_COLOR,
      ),
    );
  }
}
