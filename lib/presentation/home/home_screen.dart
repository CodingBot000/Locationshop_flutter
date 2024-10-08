import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location_shop/component/alert_widget.dart';
import 'package:location_shop/component/chips_location.dart';
import 'package:location_shop/component/home_newbeauty_grid.dart';
import 'package:location_shop/component/home_location_grid.dart';
import 'package:location_shop/component/slider_banner.dart';
import 'package:location_shop/component/title_main_and_sub.dart';
import 'package:location_shop/component/top_app_bar_home.dart';
import 'package:location_shop/model/chip_location_data.dart';
import 'package:location_shop/presentation/auth/login_screen.dart';
import 'package:location_shop/view_model/home_view_model.dart';

import '../../common/constants.dart';
import '../../common/route_arguments.dart';
import '../../component/footer_view.dart';
import '../drawer_menu/side_menu.dart';
import '../location_screen/location_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homePageState = ref.watch(hospitalViewModelProvider);
    final viewModel = ref.read(hospitalViewModelProvider.notifier);

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SliderBanner(),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(
                  left: Dimens.home_grid_horizontal_padding,
                  right: Dimens.home_grid_horizontal_padding),
              child: Column(
                children: [
                  homePageState.hospitalDatasNewBeauty.when(
                    data: (data) {
                      return HomeNewBeautyGridWidget(hospitalDatas: data);
                    },
                    loading: () => Center(child: CircularProgressIndicator()),
                    error: (error, stack) =>
                        Center(child: Text('Error HomeGridWidget: $error')),
                  ),
                  const SizedBox(height: 40),
                  const TitleMainAndSub(
                      mainTitle: 'Hospitals',
                      subTitle: 'Choose the region you want'),
                  ChipsLocation(
                      onButtonPressed: (LocationChipData selectChipData) =>
                          {viewModel.selectLocationChipData(selectChipData)}),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(context, LocationScreen.routeName)
                        },
                        child: const Row(
                          children: [
                            Text(
                              "See All",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(220, 230, 30, 30)),
                            ),
                            SizedBox(width: 3),
                            FaIcon(
                              size: 20,
                              FontAwesomeIcons.arrowUpRightFromSquare,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: HomeFixedDimens().getGridHeight(),
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Container(
                          // height: 400,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            // color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        homePageState.hospitalDatasByLocation.when(
                          data: (data) {
                            return HomeLocationGrid(
                              selectedCurLocationData:
                                  homePageState.selectLocationButton.value!,
                              hospitalList: data,
                            );
                          },
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          error: (error, stack) => Center(
                              child: Text('Error HomeLocationGrid : $error')),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const FooterView()
          ],
        ),
      ),
    );
  }
}
