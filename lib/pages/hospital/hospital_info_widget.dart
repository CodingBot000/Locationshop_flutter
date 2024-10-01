import 'package:flutter/material.dart';
import 'package:location_shop/component/circle_avatar_view.dart';
import 'package:location_shop/model/hospital_detail_data.dart';
import 'package:location_shop/model/hospital_detail_info_desc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view_model/hospitaldetail_view_model.dart';

class HospitalInfoWidget extends ConsumerStatefulWidget {
  const HospitalInfoWidget({super.key, required this.id});

  final int id;

  @override
  _HospitalInfoWidgetState createState() => _HospitalInfoWidgetState();
}


class _HospitalInfoWidgetState extends ConsumerState<HospitalInfoWidget> {
  final double fonstSizeTitle = 20;
  final double fonstSizeContent = 13;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = ref.read(hospitalDetailViewModelProvider.notifier);
      viewModel.getDetailHospitalInfoDescData(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageState = ref.watch(hospitalDetailViewModelProvider);
    final detailHospitalInfoDesc = pageState.detailHospitalInfoDesc;

    const double infoPadding = 10;
    return detailHospitalInfoDesc.when(
      data: (data) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(18.10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title("Address"),
              _subDetail(detailHospitalInfoDesc.value!.descAddress),
              const SizedBox(height: infoPadding),

              _title("Opening Hour"),
              _subDetail(detailHospitalInfoDesc.value!.openingHour),
              const SizedBox(height: infoPadding),

              _title("Facilities"),
              _subDetail(detailHospitalInfoDesc.value!.facilities),
              const SizedBox(height: infoPadding),

              if (detailHospitalInfoDesc.value!.etc.isNotEmpty) ...[
                _title("etc"),
                _subDetail(detailHospitalInfoDesc.value!.etc),
              ],
              const SizedBox(height: infoPadding),

              if (detailHospitalInfoDesc.value!.doctors.isNotEmpty) ...[
                _title("doctors"),
                Wrap(
                  spacing: 10,
                  children: detailHospitalInfoDesc.value!.doctors
                      .map((data) => CircleAvatarViewWidget(fileName: data))
                      .toList(),
                ),
              ],
            ],
          ),
        );
      },loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stack) =>
          Center(child: Text('Error HomeGridWidget: $error')),
    );
  }

  Widget _title(String title) => Text(
    title,
    style: TextStyle(fontSize: fonstSizeTitle, fontWeight: FontWeight.bold)
  );

  Widget _subDetail(String content) => Padding(
      padding: const EdgeInsets.only(left:10, right:20, top:10, bottom:15),
      child: Text(
        content,
        style: TextStyle(fontSize: fonstSizeContent),
      )
    );
}
