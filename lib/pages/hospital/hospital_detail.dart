import 'package:flutter/material.dart';
import 'package:location_shop/common/constants.dart';
import 'package:location_shop/component/chips_menu.dart';
import 'package:location_shop/component/empty_view.dart';
import 'package:location_shop/component/slider_image.dart';
import 'package:location_shop/data/hospital_detail_data.dart';
import 'package:location_shop/pages/hospital/tabs_detail.dart';
import 'package:location_shop/pages/surgery_info/surgery_info.dart';
import 'package:location_shop/server/dump_respository.dart';

import '../../common/route_arguments.dart';
import '../../common/utils/helper.dart';
import '../../component/top_app_bar_sub.dart';
import '../../data/hospital_data.dart';

class HospitalDetailScreen extends StatefulWidget {
  const HospitalDetailScreen({super.key});

  static const routeName = '/hospital-detail';

  @override
  State<HospitalDetailScreen> createState() => _HospitalDetailScreenState();
}

class _HospitalDetailScreenState extends State<HospitalDetailScreen> {
  bool isLiked = false;
  bool _isInitialized = false;
  late HospitalData? data;
  // late HospitalDetail? dataDetail;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      final args = ModalRoute.of(context)!.settings.arguments as HosptialDetailArguments;
      data = DataRepository.getHospitalInfoById(args.id);
      // dataDetail = DataRepository.getHospitalDetailInfoById(args.id);
      _isInitialized = true;
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: TopAppBarSub(
            title: data?.productName ?? "Hospital Detail",
          showLikeButton: true,
          isLiked: isLiked,
          onLikePressed: () {
            setState(() {
              isLiked = !isLiked;
            });
            if (isLiked) {

            } else {

            }
          },),
        body:
        data == null ? const EmptyView()
        : Column(
          children: [
            SliderImage(imageList: data!.images),
            ChipsMenu(onButtonPressed: (String chipName) => {

            }, chipsList: data!.surgeries.map(
                    (data) => SurgeryIdMapper[data] ?? 'Unknown').toList()),
            Expanded(child: TabsDetailWidget(data: data!))
          ],
        ),
        floatingActionButton: Column(
          children: [
            // Image.asset(dataDetail.blog.)
          ],
        ),
    );
  }
}