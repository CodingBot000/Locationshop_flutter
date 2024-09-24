import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:location_shop/common/routes.dart';
import 'package:location_shop/pages/about_us/about_us.dart';
import 'package:location_shop/pages/auth/login_screen.dart';
import 'package:location_shop/pages/event_screen/event_screen.dart';
import 'package:location_shop/pages/favorite_screen/favorite_screen.dart';
import 'package:location_shop/pages/home.dart';
import 'package:location_shop/pages/hospital/hospital_detail.dart';
import 'package:location_shop/pages/location_screen/location_screen.dart';
import 'package:location_shop/pages/surgery_info/surgery_info.dart';
import 'package:location_shop/server/dump_respository.dart';
import 'package:location_shop/server/dump_server.dart';
import 'package:location_shop/data/hospital_detail_info_desc.dart';
import 'package:location_shop/server/jsondata/hospital_detail_desc_json.dart';
import 'package:location_shop/utils/constants.dart';

import 'data/event_data.dart';
import 'data/hospital_data.dart';
import 'data/hospital_detail_data.dart';
import 'data/review_data.dart';
import 'data/surgery_data.dart';

void main() {
  // DumpServer();
  DataRepository();
  // Test();

  runApp(const MyApp());
}

// void Test() {
//   List<EventData> test1 = DumpServer().getEventData();
//   List<HospitalData> test2 = DumpServer().getHospitalData();
//   List<HospitalDetail> test3 = DumpServer().getHospitalDetailData();
//   List<DetailHospitalInfoDesc> test4 = DumpServer().getDetailHospitalInfoDescData();
//   List<ReviewData> test5 = DumpServer().getReviewData();
//   List<SurgeryData> test6 = DumpServer().getSurgeryData();
//
//   print("aaaA");
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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

final Map<String, WidgetBuilder> appRoutes = {
  HomePage.routeName: (ctx) => const HomePage(),
  LoginScreen.routeName: (ctx) => const LoginScreen(),
  SurgeryInfo.routeName: (ctx) => const SurgeryInfo(),
  LocationScreen.routeName: (ctx) => const LocationScreen(),
  HospitalDetailScreen.routeName: (ctx) => const HospitalDetailScreen(),
  FavoriteScreen.routeName: (ctx) => const FavoriteScreen(),
  EventScreen.routeName: (ctx) => const EventScreen(),
  AboutUsScreen.routeName: (ctx) => const AboutUsScreen(),
};
