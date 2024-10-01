import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location_shop/common/enums.dart';
import 'package:location_shop/model/hospital_detail_data.dart';
import 'package:location_shop/model/hospital_detail_info_desc.dart';
import 'package:location_shop/pages/event_screen/event_list_widget.dart';
import 'package:location_shop/pages/hospital/hospital_info_widget.dart';
import 'package:location_shop/pages/review/review_widget.dart';
import 'package:location_shop/repository/respository.dart';
import 'package:location_shop/view_model/hospitaldetail_view_model.dart';

import '../../component/empty_view.dart';
import '../../model/hospital_data.dart';

class TabsDetailWidget extends ConsumerStatefulWidget {
  const TabsDetailWidget({super.key, required this.data});

  final HospitalData data;

  @override
  _TabsDetailWidgetState createState() => _TabsDetailWidgetState();
}

class _TabsDetailWidgetState extends ConsumerState<TabsDetailWidget> with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(
    length: 3,
    vsync: this,
    initialIndex: 0,

    animationDuration: const Duration(milliseconds: 800),
  );

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
                  HospitalInfoWidget(id: widget.data.id),
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