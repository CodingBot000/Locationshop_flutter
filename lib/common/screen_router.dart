import 'package:flutter/material.dart';
import '../presentation/about_us/about_us_screen.dart';
import '../presentation/auth/login_screen.dart';
import '../presentation/event_screen/event_detail_screen.dart';
import '../presentation/event_screen/event_screen.dart';
import '../presentation/favorite_screen/favorite_screen.dart';
import '../presentation/home/home_screen.dart';
import '../presentation/hospital/hospital_detail_screen.dart';
import '../presentation/location_screen/location_screen.dart';
import '../presentation/surgery_info/surgery_info_screen.dart';
import '../presentation/home/home_screen.dart';


final Map<String, WidgetBuilder> appRoutes = {
  HomeScreen.routeName: (ctx) => HomeScreen(),
  LoginScreen.routeName: (ctx) => const LoginScreen(),
  SurgeryInfo.routeName: (ctx) => const SurgeryInfo(),
  LocationScreen.routeName: (ctx) => const LocationScreen(),
  HospitalDetailScreen.routeName: (ctx) => const HospitalDetailScreen(),
  FavoriteScreen.routeName: (ctx) => const FavoriteScreen(),
  EventScreen.routeName: (ctx) => const EventScreen(),
  AboutUsScreen.routeName: (ctx) => const AboutUsScreen(),
  EventDetailScreen.routeName: (ctx) => const EventDetailScreen(),
};


