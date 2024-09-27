import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
      return const SizedBox(
        height: 200,
        child: Center(
          child: Text(
            "Empty Data",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
}
