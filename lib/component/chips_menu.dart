import 'package:flutter/material.dart';

import '../common/enums.dart';

class ChipsMenu extends StatefulWidget {
  ChipsMenu(
      {super.key,
      this.mainMenuName,
      required this.onButtonPressed,
      required this.chipsList});

  final Function(String) onButtonPressed;
  MenuTitleList? mainMenuName;
  final List<String> chipsList;

  @override
  State<ChipsMenu> createState() => _ChipsMenuState();
}

class _ChipsMenuState extends State<ChipsMenu> {
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

                return RawChip(
                  label: Text(menuStr),
                  labelPadding: const EdgeInsets.all(1.0),
                  onSelected: (bool selected) {
                    setState(() {
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
