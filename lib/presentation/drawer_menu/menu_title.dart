import 'package:flutter/material.dart';

class MenuTitleWidget extends StatelessWidget {
  const MenuTitleWidget({super.key, required this.title, this.titleAlignment = Alignment.centerLeft, this.onButtonPressed});

  final String title;
  final Alignment titleAlignment;
  final Function()? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onButtonPressed != null) {
          onButtonPressed!();
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Align(
          alignment: titleAlignment,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
