import 'package:flutter/material.dart';

import '../../component/top_app_bar_sub.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  static const routeName = '/favorite';

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        appBar: TopAppBarSub(title: "Favorite"),
        body: Text(FavoriteScreen.routeName)
    );
  }
}
