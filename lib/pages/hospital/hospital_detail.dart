import 'package:flutter/material.dart';
import 'package:location_shop/component/chips_menu.dart';
import 'package:location_shop/component/empty_view.dart';
import 'package:location_shop/component/slider_image.dart';
import 'package:location_shop/model/hospital_detail_data.dart';
import 'package:location_shop/pages/hospital/sns_list_widget.dart';
import 'package:location_shop/pages/hospital/tabs_detail.dart';
import 'package:location_shop/repository/respository.dart';

import '../../common/route_arguments.dart';
import '../../common/utils/helper.dart';
import '../../component/top_app_bar_sub.dart';
import '../../model/hospital_data.dart';

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
  late HospitalDetail? dataDetail;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      final args =
          ModalRoute.of(context)!.settings.arguments as HosptialDetailArguments;
      data = DataRepository.getHospitalInfoById(args.id);
      dataDetail = DataRepository.getHospitalDetailInfoById(args.id);
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
            } else {}
          },
        ),
        body: Stack(
          children: [
            data == null
                ? const EmptyView()
                : Column(
                    children: [
                      SliderImage(imageList: data!.images),
                      ChipsMenu(
                          onButtonPressed: (String chipName) => {},
                          chipsList: data!.surgeries
                              .map((data) => surgeryIdMapper[data] ?? 'Unknown')
                              .toList()),
                      Expanded(child: TabsDetailWidget(data: data!))
                    ],
                  ),
            Positioned(
              bottom: 16.0,
              right: 16.0,
              child: SnsListWidget(detailData: dataDetail!),
            ),
          ],
        ));
  }
}
