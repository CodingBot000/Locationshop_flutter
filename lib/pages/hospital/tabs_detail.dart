import 'package:flutter/material.dart';
import 'package:location_shop/common/enums.dart';
import 'package:location_shop/data/hospital_detail_data.dart';
import 'package:location_shop/data/hospital_detail_info_desc.dart';
import 'package:location_shop/pages/event_screen/event_list_widget.dart';
import 'package:location_shop/pages/hospital/hospital_info_widget.dart';
import 'package:location_shop/pages/review/review_widget.dart';
import 'package:location_shop/server/dump_respository.dart';

import '../../component/empty_view.dart';
import '../../data/hospital_data.dart';

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
  late final HospitalDetail? dataDetail;

  @override
  void initState() {
    super.initState();
    dataDetail = DataRepository.getHospitalDetailInfoById(widget.data.id);
    descData = DataRepository.getDetailHospitalInfoDescData(widget.data.id);

    print('descData:$descData');
    print('dataDetail:$dataDetail');
  }


  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          TabBar(
            controller: tabController,
            tabs: [
              Tab(text: RecommendMenu.event.value),
              Tab(text: RecommendMenu.review.value),
              Tab(text: RecommendMenu.hospital.value),
            ],
          ),
          Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  EventListWidget(id: widget.data.id),
                  ReviewWidget(id: widget.data.id),
                  dataDetail == null || descData == null ?
                      const EmptyView()
                  : HospitalInfoWidget(detaildata: dataDetail!, descData: descData! ),
                ],
              ),
          ),
        ],
      ),
    );
  }

}