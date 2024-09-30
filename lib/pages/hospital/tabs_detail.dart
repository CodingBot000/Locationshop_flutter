import 'package:flutter/material.dart';
import 'package:location_shop/common/enums.dart';
import 'package:location_shop/model/hospital_detail_data.dart';
import 'package:location_shop/model/hospital_detail_info_desc.dart';
import 'package:location_shop/pages/event_screen/event_list_widget.dart';
import 'package:location_shop/pages/hospital/hospital_info_widget.dart';
import 'package:location_shop/pages/review/review_widget.dart';
import 'package:location_shop/repository/respository.dart';

import '../../component/empty_view.dart';
import '../../model/hospital_data.dart';

class TabsDetailWidget extends StatefulWidget {
  const TabsDetailWidget({super.key, required this.data});

  final HospitalData data;

  @override
  State<TabsDetailWidget> createState() => _TabsDetailWidgetState();
}

class _TabsDetailWidgetState extends State<TabsDetailWidget> with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(
    length: 3,
    vsync: this,
    initialIndex: 0,

    animationDuration: const Duration(milliseconds: 800),
  );
  late final DetailHospitalInfoDesc? descData;
  late final HospitalDetail? detailData;

  @override
  void initState() {
    super.initState();
    detailData = DataRepository.instance.getHospitalDetailInfoById(widget.data.id);
    descData = DataRepository.instance.getDetailHospitalInfoDescData(widget.data.id);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          TabBar(
            controller: tabController,
            tabs: [
              Tab(text: RecommendMenu.hospital.value),
              Tab(text: RecommendMenu.review.value),
              Tab(text: RecommendMenu.event.value),
            ],
          ),
          Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  detailData == null || descData == null ?
                  const EmptyView()
                      : HospitalInfoWidget(
                      detailData: detailData!,
                      descData: descData!
                  ),
                  ReviewWidget(id: widget.data.id),
                  EventListWidget(id: widget.data.id),
                ],
              ),
          ),
        ],
      ),
    );
  }

}