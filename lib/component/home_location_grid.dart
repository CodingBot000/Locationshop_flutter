import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:location_shop/common/enums.dart';
import 'package:location_shop/component/chips_location.dart';
import 'package:location_shop/data/chip_location_data.dart';
import 'package:location_shop/data/hospital_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../server/dump_respository.dart';
import 'title_main_and_sub.dart';
import '../utils/constants.dart';

class HomeLocationGrid extends StatefulWidget {
  const HomeLocationGrid({super.key});

  @override
  State<HomeLocationGrid> createState() => _HomeLocationGridState();
}

class _HomeLocationGridState extends State<HomeLocationGrid> {
  LocationChipData selectedCurLocationData =
      LocationChipData(region: LocationNames.APGUJEONG, isSelected: false);

  List<HospitalData> hosptialList =
      DataRepository.getHospitalListByLocation(LocationNames.APGUJEONG.value);

  void onButtonPressed(LocationChipData chipData) {
    setState(() {
      selectedCurLocationData = chipData;
      hosptialList = DataRepository.getHospitalListByLocation(
          selectedCurLocationData.region.value);
    });
  }

  int getItemCount() {
    if (hosptialList.length >= 6) {
      return 6;
    } else {
      return hosptialList.length;
    }
  }

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
          const SizedBox(height: 20),
          const TitleMainAndSub(
              mainTitle: 'Hospitals', subTitle: 'Choose the region you want'),
          ChipsLocation(onButtonPressed: onButtonPressed),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                "See All >",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Expanded(
          //   child:
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                // childAspectRatio: 1,
                childAspectRatio: ratio,
              ),
              // childAspectRatio: (Constants.screenWidth / 2) / ((Constants.screenWidth /2 ) * 1.2),
              // children: List.generate(6 , (index) {
              itemCount: getItemCount(),
              itemBuilder: (context, index) {
                return Center(
                  child: Image.asset(
                    hosptialList[index].images[0],
                    width: imageSize,
                    height: imageSize,
                    fit: BoxFit.cover,
                  ),
                );
              }),
          // ),
          // ),
        ],
      ),
    );
  }
}
