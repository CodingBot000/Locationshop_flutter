import 'package:flutter/material.dart';
import 'package:location_shop/common/route_arguments.dart';
import 'package:location_shop/component/grid_item_hospital.dart';
import 'package:location_shop/model/hospital_data.dart';
import 'package:location_shop/presentation/hospital/hospital_detail_screen.dart';

import '../common/constants.dart';

import 'title_main_and_sub.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeNewBeautyGridWidget extends ConsumerWidget {
  const HomeNewBeautyGridWidget({super.key, required this.hospitalDatas});
  final List<HospitalData> hospitalDatas;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
        return Column(
          children: [
            const TitleMainAndSub(
                mainTitle: 'New Beauty', subTitle: 'Today Hospital'),
            const SizedBox(height: 20),
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Constants.GRID_NUM,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: Constants.GRID_RATIO,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => {
                      Navigator.pushNamed(
                          context, HospitalDetailScreen.routeName,
                          arguments: HosptialDetailArguments(
                              hospitalDatas[index].id))
                    },
                    child: GridItemHospital(
                      imagePath: hospitalDatas[index].images[0],
                      name: hospitalDatas[index].productName
                    )
                    // child: Center(
                    //   // child: Image.network(DataRepository.newBeautyList[index].images[0])
                    //   // Image.network(
                    //   //   src: DataRepository.newBeautyList[index].images[0]
                    //   //   // height: Constants.screenWidth / 2 ,
                    //   //   // fit: BoxFit.cover,
                    //   // ),
                    //   child: Image.asset(
                    //     hospitalDatas[index].images[0],
                    //     width: Dimens.gridImageSize,
                    //     height: Dimens.gridImageSize,
                    //     fit: BoxFit.cover,
                    //     errorBuilder: (context, error, stackTrace) {
                    //       return Icon(
                    //         Icons.error,
                    //         size: Dimens.gridImageSize,
                    //         color: Colors.red,
                    //       );
                    //     },
                    //   ),
                    // ),
                  );
                }),
          ],
        //   );
        // },
        // error: (error, stack) => Center(child: Text('Error: $error')),
        // loading: () => Center(child: CircularProgressIndicator()))
    );
  }
}
