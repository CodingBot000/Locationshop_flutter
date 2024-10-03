import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location_shop/presentation/location_screen/location_screen.dart';

import '../common/constants.dart';
import '../common/route_arguments.dart';
import '../model/chip_location_data.dart';
import '../model/hospital_data.dart';
import '../presentation/hospital/hospital_detail_screen.dart';
import 'grid_item_hospital.dart';

class HomeLocationGrid extends ConsumerWidget {
  const HomeLocationGrid({super.key, required this.selectedCurLocationData, required this.hospitalList});

  final List<HospitalData> hospitalList;
  final LocationChipData selectedCurLocationData;

  int getItemCount() {
    if (hospitalList.length >= Constants.GRID_MAX_COUNT) {
      return Constants.GRID_MAX_COUNT;
    } else {
      return hospitalList.length;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Column(
      children: [
        const SizedBox(height: 10),
        GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Constants.GRID_NUM,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: Constants.GRID_RATIO,
            ),
            itemCount: getItemCount(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => {
                  Navigator.pushNamed(context, HospitalDetailScreen.routeName,
                      arguments: HosptialDetailArguments(
                          hospitalList[index].id))
                },
                child: Expanded(
                  child: GridItemHospital(
                      imagePath: hospitalList[index].images[0],
                      name: hospitalList[index].productName
                  ),
                )

              );
            }),

      ],
    );

  }
}
