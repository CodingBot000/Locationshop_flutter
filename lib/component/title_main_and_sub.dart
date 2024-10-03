import 'package:flutter/material.dart';

class TitleMainAndSub extends StatelessWidget {
  const TitleMainAndSub(
      {super.key, required this.mainTitle, required this.subTitle});

  final String mainTitle;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(mainTitle,
            style:
                const TextStyle(fontSize: 40, fontWeight: FontWeight.bold,
            color: Color.fromARGB(220, 280, 130, 130))),
        Text(subTitle,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
            color: Color.fromARGB(200, 280, 130, 130))),
      ],
    );
  }
}
