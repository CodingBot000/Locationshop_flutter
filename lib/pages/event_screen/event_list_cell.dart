import 'package:flutter/material.dart';
import 'package:location_shop/data/event_data.dart';
import 'package:location_shop/utils/constants.dart';

class EventListCell extends StatelessWidget {
  const EventListCell({super.key, required this.onButtonPressed, required this.data});
  final Function(EventData) onButtonPressed;

  final EventData data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        onButtonPressed(data)
      },
      child: Container(
        height: Dimens.listHeight,
        child: Row(
          children: [
            Image.asset(
              data.eventImg,
              width: Dimens.listImageSize,
              height: Dimens.listImageSize,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8.0), // Add some spacing between image and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch to fill width
                mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                children: [
                  // Center-aligned text
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      data.eventName,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 4.0), // Add vertical spacing
                  // Right-aligned text
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text("${data.eventDateFrom} ~ ${data.eventDateTo}"),
                  ),
                  const SizedBox(height: 4.0), // Add vertical spacing
                  // Left-aligned text
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      data.desc,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
