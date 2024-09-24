import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:location_shop/common/routes.dart';
import 'package:location_shop/component/banner_slider.dart';
import 'package:location_shop/component/home_grid.dart';
import 'package:location_shop/component/home_location_grid.dart';
import 'package:location_shop/component/title_main_and_sub.dart';
import 'package:location_shop/component/top_app_bar_home.dart';
import 'package:location_shop/pages/auth/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utils/constants.dart';
import 'drawer_menu/side_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;

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
      drawer: Drawer(child: MenuPage()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerSlider(activeIndex: activeIndex),
            Padding(
              padding: const EdgeInsets.only(
                  left: Dimens.home_grid_horizontal_padding,
                  right: Dimens.home_grid_horizontal_padding),
              child: HomeGrid(),
            ),
            Padding(
              padding: const EdgeInsets.only(
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

class FooterView extends StatelessWidget {
  const FooterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.footer_height,
      color: Colors.grey,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
          left: Dimens.home_grid_horizontal_padding,
          right: Dimens.home_grid_horizontal_padding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "@ Corp",
              style: TextStyle(color: Colors.white), // 텍스트 색을 흰색으로 변경 (선택 사항)
            ),
          ],
        ),
      ),
    );
  }
}
