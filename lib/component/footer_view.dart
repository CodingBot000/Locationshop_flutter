import 'package:flutter/material.dart';
import '../common/constants.dart';

class FooterView extends StatelessWidget {
  const FooterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.footer_height,
      color: Colors.black45,
      width: double.infinity,
      child: const Padding(
        padding: EdgeInsets.only(
          left: Dimens.home_grid_horizontal_padding,
          right: Dimens.home_grid_horizontal_padding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "@Miracle Corp",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            Text(
              "tel : 1111-2222",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "email : hellowolrd@world.com",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
