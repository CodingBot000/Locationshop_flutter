import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/provider_location_select.dart';
import '../model/chip_location_data.dart';

class ChipsLocation extends ConsumerWidget {
  const ChipsLocation({super.key, required this.onButtonPressed});

  final Function(LocationChipData) onButtonPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationChips = ref.watch(locationChipProvider);

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 10.0),
          Wrap(
            spacing: 5.0,
            children: locationChips.map((locationChipData) {
              return ChoiceChip(
                label: Text(locationChipData.region.value),
                labelPadding: const EdgeInsets.all(1.0),
                selected: locationChipData.isSelected,
                onSelected: (_) {
                  final read = ref.read(locationChipProvider.notifier);
                  read.toggleSelection(locationChipData.region);
                  onButtonPressed(locationChipData);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
