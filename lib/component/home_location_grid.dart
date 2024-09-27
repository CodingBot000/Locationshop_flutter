import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:location_shop/common/enums.dart';
import 'package:location_shop/component/chips_location.dart';
import 'package:location_shop/data/chip_location_data.dart';
import 'package:location_shop/data/hospital_data.dart';
import 'package:location_shop/pages/location_screen/location_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../common/route_arguments.dart';
import '../pages/hospital/hospital_detail.dart';
import '../server/dump_respository.dart';
import 'title_main_and_sub.dart';
import '../common/constants.dart';

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
    return Container(
      child: Column(
        children: [
          const TitleMainAndSub(
              mainTitle: 'Hospitals', subTitle: 'Choose the region you want'),
          ChipsLocation(onButtonPressed: onButtonPressed),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => {
                  Navigator.pushNamed(context, LocationScreen.routeName,
                  arguments: MenuScreenLocationArguments(selectedCurLocationData))
                },
                child: const Text(
                  "See All >",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Expanded(
          //   child:
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Constants.GRID_NUM,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: Constants.GRID_RATIO,
              ),
              itemCount: getItemCount(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => {
                    Navigator.pushNamed(context,
                        HospitalDetailScreen.routeName,
                        arguments: HosptialDetailArguments(DataRepository.newBeautyList[index].id))
                  },
                  child: Center(
                    child: Image.asset(
                      hosptialList[index].images[0],
                      width: Dimens.gridImageSize,
                      height: Dimens.gridImageSize,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.error,
                          size: Dimens.gridImageSize,
                          color: Colors.red,
                        );
                      },
                    ),
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
