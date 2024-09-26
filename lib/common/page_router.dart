import 'package:flutter/cupertino.dart';

import '../pages/about_us/about_us.dart';
import '../pages/auth/login_screen.dart';
import '../pages/event_screen/event_detail_screen.dart';
import '../pages/event_screen/event_screen.dart';
import '../pages/favorite_screen/favorite_screen.dart';
import '../pages/home.dart';
import '../pages/hospital/hospital_detail.dart';
import '../pages/location_screen/location_screen.dart';
import '../pages/surgery_info/surgery_info.dart';


final Map<String, WidgetBuilder> appRoutes = {
  HomePage.routeName: (ctx) => const HomePage(),
  LoginScreen.routeName: (ctx) => const LoginScreen(),
  SurgeryInfo.routeName: (ctx) => const SurgeryInfo(),
  LocationScreen.routeName: (ctx) => const LocationScreen(),
  HospitalDetailScreen.routeName: (ctx) => const HospitalDetailScreen(),
  FavoriteScreen.routeName: (ctx) => const FavoriteScreen(),
  EventScreen.routeName: (ctx) => const EventScreen(),
  AboutUsScreen.routeName: (ctx) => const AboutUsScreen(),
  EventDetailScreen.routeName: (ctx) => const EventDetailScreen(),
};


