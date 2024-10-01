import 'package:flutter/material.dart';
import 'package:location_shop/pages/home/home.dart';
import 'package:location_shop/repository/respository.dart';
import 'package:location_shop/common/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'common/page_router.dart';

void main() {
  DataRepository();
  runApp(ProviderScope(child: MyApp())) ;
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
      initialRoute: HomePage.routeName,
      routes: appRoutes,
    );
  }
}
