import 'package:flutter/material.dart';
import 'package:location_shop/server/dump_server.dart';
import 'package:location_shop/presentation/home/home_screen.dart';

import 'package:location_shop/common/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'common/screen_router.dart';

void main() {
  DumpServer();
  runApp(const ProviderScope(child: MyApp())) ;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Constants.screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      initialRoute: HomeScreen.routeName,
      routes: appRoutes,
    );
  }
}
