import 'package:flutter/material.dart';
import 'package:location_shop/common/enums.dart';
import 'package:location_shop/pages/about_us/about_us.dart';
import 'package:location_shop/pages/event_screen/event_list_widget.dart';
import 'package:location_shop/pages/event_screen/event_screen.dart';
import 'package:location_shop/pages/hospital/hospital_info_widget.dart';
import 'package:location_shop/pages/review/review_widget.dart';

class TabsDetailWidget extends StatefulWidget {
  const TabsDetailWidget({Key? key}) : super(key: key);

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

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String event = RecommendMenu.EVENT.value;
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          TabBar(
            controller: tabController,
            tabs: [
              Tab(text: RecommendMenu.EVENT.value),
              Tab(text: RecommendMenu.REVIEW.value),
              Tab(text: RecommendMenu.HOSPITAL.value),
            ],
          ),
          Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  EventListWidget(),
                  ReviewWidget(),
                  HospitalInfoWidget(),
                ],
              ),
          ),
        ],
      ),
    );
  }

}