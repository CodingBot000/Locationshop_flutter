import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:location_shop/common/route_arguments.dart';
import 'package:location_shop/component/slider_banner.dart';
import 'package:location_shop/component/home_grid.dart';
import 'package:location_shop/component/home_location_grid.dart';
import 'package:location_shop/component/title_main_and_sub.dart';
import 'package:location_shop/component/top_app_bar_home.dart';
import 'package:location_shop/pages/auth/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../common/constants.dart';
import '../component/footer_view.dart';
import 'drawer_menu/side_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBarHome(
        backgroundColor: Colors.white,
        actions: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: GestureDetector(
                  onTap: () =>
                      {Navigator.pushNamed(context, LoginScreen.routeName)},
                  child: Text("Login")))
        ],
      ),
      drawer: const Drawer(child: MenuPage()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SliderBanner(),
            const SizedBox(height: 40),
            const Padding(
              padding: const EdgeInsets.only(
                  left: Dimens.home_grid_horizontal_padding,
                  right: Dimens.home_grid_horizontal_padding),
              child: HomeGrid(),
            ),
            const SizedBox(height: 40),
            const Padding(
              padding: const EdgeInsets.only(
                  left: Dimens.home_grid_horizontal_padding,
                  right: Dimens.home_grid_horizontal_padding),
              child: HomeLocationGrid(),
            ),
            const SizedBox(height: 20),
            const FooterView()
          ],
        ),
      ),
    );
  }
}
