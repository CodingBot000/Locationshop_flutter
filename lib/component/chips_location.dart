import 'package:flutter/material.dart';
import 'package:location_shop/common/init_value.dart';

import 'package:location_shop/repository/respository.dart';

import '../common/enums.dart';
import '../model/chip_location_data.dart';

class ChipsLocation extends StatefulWidget {
  const ChipsLocation({super.key, required this.onButtonPressed, this.selectedCurLocationData});

  final Function(LocationChipData) onButtonPressed;
  final LocationChipData? selectedCurLocationData;

  @override
  State<ChipsLocation> createState() => _ChipsLocationState();
}

class _ChipsLocationState extends State<ChipsLocation> {
  int? _value = 0;
  List<LocationChipData> locationChipsList = InitValue.locationChipList;
  late LocationChipData _selectedCurLocationData;

  @override
  void initState() {
    super.initState();
    _selectedCurLocationData = widget.selectedCurLocationData ??
        LocationChipData(
          region: LocationNames.ApguJeong,
          isSelected: false,
        );

    _initializeSelectedValue();
  }

  void _initializeSelectedValue() {
    for (int i = 0; i < locationChipsList.length; i++) {
      if (locationChipsList[i].region ==
          _selectedCurLocationData.region) {
        _value = i;
        break;
      }
    }
  }

  void _handleButtonPress(LocationChipData data) {
    setState(() {
      _selectedCurLocationData = data;
    });

    widget.onButtonPressed(data);
  }

  @override
  Widget build(BuildContext context) {
    // final TextTheme textTheme = Theme.of(context).textTheme;

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 10.0),
          Wrap(
            spacing: 5.0,
            children: List<Widget>.generate(
              locationChipsList.length,
              (int index) {
                return ChoiceChip(
                  label:
                      Text(locationChipsList[index].region.value),
                  labelPadding: const EdgeInsets.all(1.0),
                  selected: _value == index,
                  onSelected: (bool selected) {
                    setState(() {
                      _value = selected ? index : null;
                      LocationChipData data =
                          locationChipsList[index];
                      _handleButtonPress(data);
                      _selectedLocationChipList(data.region);
                    });
                  },
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }

  void _selectedLocationChipList(LocationNames selectedLocation) {
    for (var location in locationChipsList) {
      location.isSelected = false;
      if (location.region == selectedLocation) {
        location.isSelected = true;
      }
    }
  }
}
