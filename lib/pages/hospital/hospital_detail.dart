import 'package:flutter/material.dart';

import '../../common/routes.dart';
import '../../component/top_app_bar_sub.dart';

class HospitalDetailScreen extends StatefulWidget {
  const HospitalDetailScreen({super.key});

  static const routeName = '/hospital-detail';

  @override
  State<HospitalDetailScreen> createState() => _HospitalDetailScreenState();
}

class _HospitalDetailScreenState extends State<HospitalDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MenuScreenArguments;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: TopAppBarSub(title: HospitalDetailScreen.routeName),
        body: Text(args.menuTitle)
    );
  }
}