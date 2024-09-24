
import 'package:flutter/material.dart';

import '../../common/routes.dart';
import '../../component/top_app_bar_sub.dart';

class SurgeryInfo extends StatelessWidget {
  const SurgeryInfo({super.key});

  static const routeName = '/menu/surgery-info';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MenuScreenArguments;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: TopAppBarSub(title: SurgeryInfo.routeName),
        body: Text(args.menuTitle)
    );
  }
}