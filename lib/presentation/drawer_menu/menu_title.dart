import 'package:flutter/material.dart';

class MenuTitleWidget extends StatelessWidget {
  const MenuTitleWidget({super.key, required this.title, this.onButtonPressed});

  final String title;
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
          alignment: Alignment.centerLeft,
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
