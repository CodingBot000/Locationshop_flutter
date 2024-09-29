import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location_shop/pages/location_screen/location_screen.dart';

import '../common/constants.dart';
import '../common/route_arguments.dart';
import '../model/chip_location_data.dart';
import '../model/hospital_data.dart';
import '../pages/hospital/hospital_detail.dart';

class HomeLocationGrid extends ConsumerWidget {
  // const HomeLocationGrid({super.key});
  const HomeLocationGrid({super.key, required this.selectedCurLocationData, required this.hosptialList});

  final List<HospitalData> hosptialList;
  final LocationChipData selectedCurLocationData;


  int getItemCount() {
    if (hosptialList.length >= 6) {
      return 6;
    } else {
      return hosptialList.length;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () => {
                Navigator.pushNamed(context, LocationScreen.routeName,
                    arguments:
                        MenuScreenLocationArguments(selectedCurLocationData))
              },
              child: const Text(
                "See All >",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
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
                          hosptialList[index].id))
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
      ],
    );
  }
}
