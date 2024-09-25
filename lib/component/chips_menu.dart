import 'package:flutter/material.dart';
import 'package:location_shop/common/init_value.dart';
import 'package:location_shop/data/chip_location_data.dart';
import 'package:location_shop/server/dump_respository.dart';

import '../common/enums.dart';

class ChipsMenu extends StatefulWidget {
  const ChipsMenu(
      {super.key, required this.mainMenuName, required this.onButtonPressed, required this.chipsList});

  final Function(String) onButtonPressed;
  final MenuTitleList mainMenuName;
  final List<String> chipsList;

  @override
  State<ChipsMenu> createState() => _ChipsMenuState();
}

class _ChipsMenuState extends State<ChipsMenu> {
  // int? _value = 0;

  void _handleButtonPress(String data) {
    widget.onButtonPressed(data);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 10.0),
          Wrap(
            spacing: 5.0,
            children: List<Widget>.generate(
              widget.chipsList.length,
              (int index) {
                String menuStr = widget.chipsList[index];
                if (widget.mainMenuName == MainMenuName.SURGICAL_PROCEDURE
                || widget.mainMenuName == MainMenuName.COSMETIC_PROCEDURE) {
                  if (menuStr.contains('surgery_')) {
                    menuStr = menuStr.replaceAll('surgery_', '');
                  } else {
                    menuStr = menuStr.replaceAll('cosmetic_', '');
                  }
                }
                return RawChip(
                  label: Text(menuStr),
                  labelPadding: const EdgeInsets.all(1.0),
                  onSelected: (bool selected) {
                    setState(() {
                      // _value = selected ? index : null;
                      _handleButtonPress(menuStr);
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
}
