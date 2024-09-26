import 'package:flutter/material.dart';
import 'package:location_shop/common/enums.dart';

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

    /// 탭 변경 애니메이션 시간
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
    return TabBar(
      controller: tabController,
      tabs: [
        Tab(text: RecommendMenu.EVENT.value),
        Tab(text: RecommendMenu.REVIEW.value),
        Tab(text: RecommendMenu.HOSPITAL.value),
      ],
    );
  }

}