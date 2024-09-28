import 'package:flutter/material.dart';
import 'package:location_shop/common/route_arguments.dart';
import 'package:location_shop/component/chips_location.dart';
import 'package:location_shop/data/chip_location_data.dart';
import 'package:location_shop/data/hospital_data.dart';
import 'package:location_shop/pages/drawer_menu/menu_title.dart';
import 'package:location_shop/pages/hospital/hospital_detail.dart';

import '../../common/constants.dart';
import '../../component/empty_view.dart';
import '../../component/top_app_bar_sub.dart';
import '../../server/dump_respository.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  static const routeName = '/location';

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  List<HospitalData> gridListByLocation = [];
  late LocationChipData selectedCurLocationData;
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      final args = ModalRoute.of(context)!.settings.arguments
          as MenuScreenLocationArguments;
      selectedCurLocationData = args.chipData;
      gridListByLocation = DataRepository.getHospitalListByLocation(
          selectedCurLocationData.region.value);
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    void onButtonPressed(LocationChipData chipData) {
      setState(() {
        selectedCurLocationData = chipData;
        gridListByLocation = DataRepository.getHospitalListByLocation(
            selectedCurLocationData.region.value);
      });
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const TopAppBarSub(title: "Locations"),
        body: Column(
          children: [
            MenuTitleWidget(title: selectedCurLocationData.region.value),
            ChipsLocation(
              onButtonPressed: onButtonPressed,
              selectedCurLocationData: selectedCurLocationData,
            ),
            Expanded(
                child: gridListByLocation.isEmpty
                    ? const EmptyView()
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 300,
                              child: googleMap(),
                            ),
                            GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: Constants.GRID_NUM,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: Constants.GRID_RATIO,
                              ),
                              itemCount: gridListByLocation.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () => {
                                    Navigator.pushNamed(
                                        context, HospitalDetailScreen.routeName,
                                        arguments: HosptialDetailArguments(
                                            DataRepository
                                                .newBeautyList[index].id))
                                  },
                                  child: Center(
                                    child: Image.asset(
                                      gridListByLocation[index].images[0],
                                      width: Dimens.gridImageSize,
                                      height: Dimens.gridImageSize,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Icon(
                                          Icons.error,
                                          size: Dimens.gridImageSize,
                                          color: Colors.red,
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      )),
          ],
        ));
  }

  Widget googleMap() {
    return const SizedBox(
      height: 300,
      child: Center(
        child: Text(
          "Google Map ... to be continue..",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
