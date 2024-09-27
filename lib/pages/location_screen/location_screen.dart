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
  // var _currentLocation = LocationNames.APGUJEONG.value;
  List<HospitalData> gridListByLocation = [];
  late LocationChipData selectedCurLocationData;
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      final args = ModalRoute.of(context)!.settings.arguments as MenuScreenLocationArguments;
      selectedCurLocationData = args.chipData;
      gridListByLocation = DataRepository.getHospitalListByLocation(selectedCurLocationData.region.value);
      _isInitialized = true;
    }
  }

  @override
  void initState() {
    super.initState();
    // gridListByLocation = DataRepository.getHospitalListByLocation(_currentLocation);
  }

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as MenuScreenLocationArguments;
    // LocationChipData selectedCurLocationData = args.chipData;
    // gridListByLocation = DataRepository.getHospitalListByLocation(selectedCurLocationData.region.value);
    // //
    //
    //
    // List<HospitalData> hosptialList =
    // DataRepository.getHospitalListByLocation(LocationNames.APGUJEONG.value);


    void onButtonPressed(LocationChipData chipData) {
      setState(() {
        selectedCurLocationData = chipData;
        gridListByLocation = DataRepository.getHospitalListByLocation(
            selectedCurLocationData.region.value);
      });
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: TopAppBarSub(title: "Locations"),
        body: Column(
          children: [
            MenuTitleWidget(title: selectedCurLocationData.region.value),
            ChipsLocation(onButtonPressed: onButtonPressed,
            selectedCurLocationData: selectedCurLocationData,),
            // ChipsLocation(
            //     selectedCurLocationData: _currentLocation,
            //     onButtonPressed: (LocationChipData location) {
            //       _currentLocation = location;
            //       setState(() {
            //         gridListByLocation = DataRepository.getHospitalListByLocation(_currentLocation.region.value);
            //
            //       });
            //     }),

            // ChipsMenu(
            //     onButtonPressed: (String location) {
            //         _currentLocation = location;
            //         setState(() {
            //           gridListByLocation = DataRepository.getHospitalListByLocation(_currentLocation);
            //
            //         });
            //     },
            //     chipsList: LocationNames.namesList()),
        Expanded(
            child: gridListByLocation.isEmpty ? const EmptyView()
            : SingleChildScrollView(
              child: Column(
                children: [
                  // GoogleMap 고정된 높이 설정
                  Container(
                    height: 300, // 원하는 높이로 설정
                    child: GoogleMap(), // GoogleMap 위젯 추가
                  ),

                  // GridView.builder with shrinkWrap and NeverScrollableScrollPhysics
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(), // GridView 자체는 스크롤되지 않음
                    shrinkWrap: true, // 내부 컨텐츠 크기에 맞춰서 그리드 높이 조정
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: Constants.GRID_NUM, // 그리드 열 개수
                      crossAxisSpacing: 10.0, // 그리드 아이템 간 가로 간격
                      mainAxisSpacing: 10.0, // 그리드 아이템 간 세로 간격
                      childAspectRatio: Constants.GRID_RATIO, // 그리드 비율
                    ),
                    itemCount: gridListByLocation.length, // 아이템 개수
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(context,
                              HospitalDetailScreen.routeName,
                              arguments: HosptialDetailArguments(DataRepository.newBeautyList[index].id))
                        },
                        child: Center(
                          child: Image.asset(
                            gridListByLocation[index].images[0],
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
                    },
                  ),
                ],
              ),
            )
        ),
          ],
        )
    );
  }
  Widget GoogleMap() {
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