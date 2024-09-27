import 'package:flutter/material.dart';

class CircleAvatarViewWidget extends StatelessWidget {
  final String fileName;

  const CircleAvatarViewWidget({super.key, required this.fileName});

  @override
  Widget build(BuildContext context) {
    const double size = 50;
    return ClipOval(
      child: Image.asset(
        'assets/images/doctors/$fileName',
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(
            Icons.error,
            size: size,
            color: Colors.red,
          );
        },
      ),
    );
  }
}