import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location_shop/component/alert_widget.dart';
import 'package:location_shop/component/chips_location.dart';
import 'package:location_shop/component/home_grid.dart';
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
                      return HomeGridWidget(hospitalDatas: data);
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
                          Navigator.pushNamed(context, LocationScreen.routeName,
                              arguments:
                              MenuScreenLocationArguments(homePageState.selectLocationButton.value!))
                        },
                        child: const Text(
                          "See All >",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: HomeFixedDimens().getGridHeight(), // Ensure the Stack has a fixed height
                    width: double.infinity,
                    child: Stack(
                      children: [
                        // Background view occupying space for 6 items
                        Container(
                          // height: 400,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            // color: Colors.grey.shade200,
                            // Example background color
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          // Optional: Add any widgets you want in the background
                          // child: Center(
                          //   child: Text(
                          //     'Background Placeholder',
                          //     style: TextStyle(
                          //         color: Colors.grey.shade400, fontSize: 16),
                          //   ),
                          // ),
                        ),
                        homePageState.hospitalDatasByLocation.when(
                          data: (data) {
                            return HomeLocationGrid(
                              selectedCurLocationData:
                                  homePageState.selectLocationButton.value!,
                              hosptialList: data,
                            );
                          },
                          loading: () =>
                              Center(child: CircularProgressIndicator()),
                          error: (error, stack) => Center(
                              child: Text('Error HomeLocationGrid : $error')),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const FooterView()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
