import 'package:flutter/material.dart';
import 'package:location_shop/component/alert_widget.dart';
import 'package:location_shop/component/chips_menu.dart';
import 'package:location_shop/component/empty_view.dart';
import 'package:location_shop/component/slider_image.dart';
import 'package:location_shop/model/hospital_detail_data.dart';
import 'package:location_shop/component/sns_list_widget.dart';
import 'package:location_shop/pages/hospital/tabs_detail.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../common/route_arguments.dart';
import '../../common/utils/helper.dart';
import '../../component/top_app_bar_sub.dart';
import '../../model/hospital_data.dart';
import '../../view_model/hospitaldetail_view_model.dart';

class HospitalDetailScreen extends ConsumerStatefulWidget {
  const HospitalDetailScreen({super.key});

  static const routeName = '/hospital-detail';

  @override
  _HospitalDetailScreenState createState() => _HospitalDetailScreenState();
}

class _HospitalDetailScreenState extends ConsumerState<HospitalDetailScreen> {
  bool isLiked = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args =
          ModalRoute.of(context)!.settings.arguments as HosptialDetailArguments;
      final viewModel = ref.read(hospitalDetailViewModelProvider.notifier);
      viewModel.getHospitalDataInfoById(args.id);
      viewModel.getHospitalDetailInfoById(args.id);

      ref.listen<HospitalDetailPageState>(hospitalDetailViewModelProvider,
            (previous, next) {
          if (previous?.hospitalDetail is! AsyncError &&
              next.hospitalDetail is AsyncError) {
            final error = (next.hospitalDetail as AsyncError).error;
            showAlertDialog(context, "Error", Text(error.toString()));
          }

          if (previous?.detailHospitalInfoDesc is! AsyncError &&
              next.detailHospitalInfoDesc is AsyncError) {
            final error = (next.detailHospitalInfoDesc as AsyncError).error;
            showAlertDialog(context, "Error", Text(error.toString()));
          }
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageState = ref.watch(hospitalDetailViewModelProvider);

    final hospitalData = pageState.hospitalData;
    final hospitalDetailData = pageState.hospitalDetail;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: TopAppBarSub(
          title: hospitalData.value?.productName ?? "Hospital Detail",
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
            hospitalData.when(
              data: (data) {
                return Column(
                  children: [
                    SliderImage(imageList: hospitalData.value!.images),
                    ChipsMenu(
                        onButtonPressed: (String chipName) => {},
                        chipsList: hospitalData.value!.surgeries
                            .map((data) => surgeryIdMapper[data] ?? 'Unknown')
                            .toList()),
                    Expanded(child: TabsDetailWidget(data: hospitalData.value!))
                  ],
                );
              },
              loading: () => Center(child: CircularProgressIndicator()),
              error: (error, stack) =>
                  Center(child: Text('Error Home detail info Main: $error')),
            ),

            hospitalDetailData.when(
                data: (data) {
                  return Positioned(
                    bottom: 136.0,
                    right: 16.0,
                    child: SnsListWidget(
                        snsInfoList: _getDetailData(hospitalDetailData.value!)),
                  );
                },
                loading: () => SizedBox.shrink(),
                error: (error, stack) =>SizedBox.shrink(),)
          ],
        ));
  }

  List<SNSInfoResult> _getDetailData(HospitalDetail detailData) {
    return getSNSInfoList(detailData);
  }
}
