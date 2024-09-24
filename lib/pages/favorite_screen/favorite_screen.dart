import 'package:flutter/material.dart';

import '../../common/routes.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  static const routeName = '/favorite';

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as MenuScreenArguments;
    return Text(FavoriteScreen.routeName);
  }
}
