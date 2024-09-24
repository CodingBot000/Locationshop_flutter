import 'package:flutter/material.dart';
import 'package:location_shop/data/chip_location_data.dart';
import 'package:location_shop/server/dump_respository.dart';

import '../common/enums.dart';

class ChipsLocation extends StatefulWidget {
  const ChipsLocation({super.key, required this.onButtonPressed});

  final Function(LocationChipData) onButtonPressed;

  @override
  State<ChipsLocation> createState() => _ChipsLocationState();
}

class _ChipsLocationState extends State<ChipsLocation> {
  int? _value = 0;
  LocationChipData _selectedCurLocationData =
      LocationChipData(region: LocationNames.APGUJEONG, isSelected: false);

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
          // Text('Choose an item', style: textTheme.labelLarge),
          const SizedBox(height: 10.0),
          Wrap(
            spacing: 5.0,
            children: List<Widget>.generate(
              DataRepository.locationChipList.length,
              (int index) {
                return ChoiceChip(
                  label:
                      Text(DataRepository.locationChipList[index].region.value),
                  selected: _value == index,
                  onSelected: (bool selected) {
                    setState(() {
                      _value = selected ? index : null;
                      LocationChipData data =
                          DataRepository.locationChipList[index];
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
    for (var location in DataRepository.locationChipList) {
      location.isSelected = false;
      if (location.region == selectedLocation) {
        location.isSelected = true;
      }
    }
  }
}
