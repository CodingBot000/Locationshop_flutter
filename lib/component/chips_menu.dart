import 'package:flutter/material.dart';

import '../common/enums.dart';

class ChipsMenu extends StatefulWidget {
  const ChipsMenu(
      {super.key,
      this.mainMenuName,
      required this.onButtonPressed,
      required this.chipsList});

  final Function(String) onButtonPressed;
  final MenuTitleList? mainMenuName;
  final List<String> chipsList;

  @override
  State<ChipsMenu> createState() => _ChipsMenuState();
}

class _ChipsMenuState extends State<ChipsMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                    widget.onButtonPressed(menuStr);
                  });
                },
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
