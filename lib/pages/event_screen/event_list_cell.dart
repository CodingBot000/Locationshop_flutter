import 'package:flutter/material.dart';
import 'package:location_shop/data/event_data.dart';
import 'package:location_shop/common/constants.dart';

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
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.error,
                  size: Dimens.listImageSize,
                  color: Colors.red,
                );
              },
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      data.eventName,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text("${data.eventDateFrom} ~ ${data.eventDateTo}"),
                  ),
                  const SizedBox(height: 4.0),
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
