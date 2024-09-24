import 'package:flutter/material.dart';

import '../../common/routes.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  static const routeName = '/about-us';

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as MenuScreenArguments;
    return Text(AboutUsScreen.routeName);
  }
}
