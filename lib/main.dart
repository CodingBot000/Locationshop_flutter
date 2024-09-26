import 'package:flutter/material.dart';
import 'package:location_shop/pages/home.dart';
import 'package:location_shop/server/dump_respository.dart';
import 'package:location_shop/common/constants.dart';

import 'common/page_router.dart';

void main() {
  DataRepository();
  runApp(const MyApp());
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
