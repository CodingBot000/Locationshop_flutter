import 'package:flutter/material.dart';

import '../../common/routes.dart';
import '../../component/top_app_bar_sub.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as MenuScreenArguments;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: TopAppBarSub(title: LoginScreen.routeName),
        body: Text(LoginScreen.routeName)
    );
  }
}
