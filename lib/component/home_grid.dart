import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../server/dump_respository.dart';
import 'title_main_and_sub.dart';
import '../utils/constants.dart';

class HomeGrid extends StatefulWidget {
  const HomeGrid({super.key});

  @override
  State<HomeGrid> createState() => _HomeGridState();
}

class _HomeGridState extends State<HomeGrid> {
  @override
  Widget build(BuildContext context) {
    const int GRID_NUM = 2;
    // final double ratio = (Constants.screenWidth / GRID_NUM) / ((Constants.screenWidth /GRID_NUM ) );
    const double ratio = 1;
    final imageSize =
        Constants.screenWidth / 2 - Dimens.home_grid_horizontal_padding * 2;
    return Container(
      // height: (Constants.screenWidth / 2) * 4,
      child: Column(
        children: [
          const TitleMainAndSub(
              mainTitle: 'New Beauty', subTitle: 'Today Hospital'),
          const SizedBox(height: 20),
          // Expanded(
          //   child:
          GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: GRID_NUM,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: ratio,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Center(
                  // child: Image.network(DataRepository.newBeautyList[index].images[0])
                  // Image.network(
                  //   src: DataRepository.newBeautyList[index].images[0]
                  //   // height: Constants.screenWidth / 2 ,
                  //   // fit: BoxFit.cover,
                  // ),
                  child: Image.asset(
                    DataRepository.newBeautyList[index].images[0],
                    width: imageSize,
                    height: imageSize,
                    fit: BoxFit.cover,
                  ),
                );
              }),
          // ),
        ],
      ),
    );
  }
}
