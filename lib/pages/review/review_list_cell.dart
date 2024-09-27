import 'package:flutter/material.dart';
import 'package:location_shop/data/event_data.dart';
import 'package:location_shop/common/constants.dart';
import 'package:location_shop/data/review_data.dart';

import '../../common/utils/helper.dart';

class ReviewListCell extends StatelessWidget {
  const ReviewListCell(
      {super.key, required this.onButtonPressed, required this.data});

  final Function(ReviewData) onButtonPressed;

  final ReviewData data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {onButtonPressed(data)},
      child: Card(
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            if (data.reviewImg.isNotEmpty)
              Image.asset(
                data.reviewImg,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.error,
                    size: 150,
                    color: Colors.red,
                  );
                },
              ),
            // const SizedBox(height: 8.0),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data.reviewDesc,
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      // Align(
                      //   alignment: Alignment.centerLeftt,
                      //   child:
                      Text(data.userId),
                      // ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(SurgeryIdMapper[data.surgeryId] ?? ""),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
