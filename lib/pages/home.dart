import 'package:flutter/material.dart' hide CarouselController;
import 'package:location_shop/component/home_grid.dart';
import 'package:location_shop/component/home_location_grid.dart';
import 'package:location_shop/component/slider_banner.dart';
import 'package:location_shop/component/top_app_bar_home.dart';
import 'package:location_shop/pages/auth/login_screen.dart';

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
              margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: GestureDetector(
                  onTap: () =>
                      {Navigator.pushNamed(context, LoginScreen.routeName)},
                  child: const Text("Login")))
        ],
      ),
      drawer: const Drawer(child: MenuPage()),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SliderBanner(),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.only(
                  left: Dimens.home_grid_horizontal_padding,
                  right: Dimens.home_grid_horizontal_padding),
              child: HomeGrid(),
            ),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.only(
                  left: Dimens.home_grid_horizontal_padding,
                  right: Dimens.home_grid_horizontal_padding),
              child: HomeLocationGrid(),
            ),
            SizedBox(height: 20),
            FooterView()
          ],
        ),
      ),
    );
  }
}
