import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location_shop/common/route_arguments.dart';
import 'package:location_shop/component/chips_location.dart';
import 'package:location_shop/model/chip_location_data.dart';
import 'package:location_shop/presentation/drawer_menu/menu_title.dart';
import 'package:location_shop/presentation/hospital/hospital_detail_screen.dart';
import 'package:location_shop/view_model/location_view_model.dart';

import '../../common/constants.dart';
import '../../common/provider_location_select.dart';
import '../../component/empty_view.dart';
import '../../component/top_app_bar_sub.dart';

class LocationScreen extends ConsumerStatefulWidget {
  static const routeName = '/location';

  const LocationScreen({super.key});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends ConsumerState<LocationScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = ref.read(locationViewModelProvider.notifier);
      final locationChips = ref.read(locationChipProvider);

      final lastSelected = locationChips.firstWhere(
            (chip) => chip.isSelected,
        orElse: () => locationChips.first,
      );
      viewModel.selectLocationChipData(lastSelected);
    });
  }

  @override
  Widget build(BuildContext context) {
    final locationPageState = ref.watch(locationViewModelProvider);
    final viewModel = ref.read(locationViewModelProvider.notifier);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const TopAppBarSub(title: "Locations"),
        body: Column(
          children: [
            MenuTitleWidget(
                title:
                    locationPageState.selectLocationButton.value!.region.value,
              titleAlignment: Alignment.center
            ),
            ChipsLocation(
              onButtonPressed: (LocationChipData chipData) =>
                  {viewModel.selectLocationChipData(chipData)},
            ),
            locationPageState.hospitalDatasByLocation.when(
              data: (data) {
                return Expanded(
                    child: data.isEmpty
                        ? const EmptyView()
                        : SingleChildScrollView(
                            child: Column(
                              children: [
                                // SizedBox(
                                //   height: 300,
                                //   child: googleMap(),
                                // ),
                                GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: Constants.GRID_NUM,
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 10.0,
                                    childAspectRatio: Constants.GRID_RATIO,
                                  ),
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () => {
                                        Navigator.pushNamed(context,
                                            HospitalDetailScreen.routeName,
                                            arguments: HosptialDetailArguments(
                                                data[index].id))
                                      },
                                      child: Center(
                                        child: Image.asset(
                                          data[index].images[0],
                                          width: Dimens.gridImageSize,
                                          height: Dimens.gridImageSize,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Icon(
                                              Icons.error,
                                              size: Dimens.gridImageSize,
                                              color: Colors.red,
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ));
              },
              loading: () => Container(
                height: 300,
                width: double.infinity,
                child: const Center(child: CircularProgressIndicator()),
              ),
              error: (error, stack) =>
                  Center(child: Text('Error LocationScreen: $error')),
            ),
          ],
        ));
  }

  Widget googleMap() {
    return const SizedBox(
      height: 300,
      child: Center(
        child: Text(
          "Google Map ... to be continue..",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
