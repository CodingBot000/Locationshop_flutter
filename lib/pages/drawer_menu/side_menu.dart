import 'package:flutter/material.dart';
import 'package:location_shop/common/routes.dart';
import 'package:location_shop/component/chips_menu.dart';
import 'package:location_shop/pages/about_us/about_us.dart';
import 'package:location_shop/pages/event_screen/event_screen.dart';
import 'package:location_shop/pages/favorite_screen/favorite_screen.dart';
import 'package:location_shop/pages/surgery_info/surgery_info.dart';

import '../../common/enums.dart';
import 'menu_title.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  static const routeName = '/menu';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        MenuTitleWidget(title: MenuTitleList.SURGICAL_PROCEDURE.value),
        ChipsMenu(
            onButtonPressed: (String chip) {
              Navigator.popAndPushNamed(
                context,
                SurgeryInfo.routeName,
                arguments: MenuScreenArguments(chip),
              );
            },
            chipsList: SurgeryResList.namesList()),
        MenuTitleWidget(title: MenuTitleList.COSMETIC_PROCEDURE.value),
        ChipsMenu(
            onButtonPressed: (String chip) {
              Navigator.popAndPushNamed(
                context,
                SurgeryInfo.routeName,
                arguments: MenuScreenArguments(chip),
              );
            },
            chipsList: CosmeticResList.namesList()),
        MenuTitleWidget(title: MenuTitleList.LOCATION.value),
        ChipsMenu(
            onButtonPressed: (String location) {
              Navigator.popAndPushNamed(
                context,
                SurgeryInfo.routeName,
                arguments: MenuScreenArguments(location),
              );
            },
            chipsList: LocationNames.namesList()),
        MenuTitleWidget(
          title: MenuTitleList.FAVORITE.value,
          onButtonPressed: () =>
              {Navigator.popAndPushNamed(context, FavoriteScreen.routeName)},
        ),
        MenuTitleWidget(
          title: MenuTitleList.EVENT.value,
          onButtonPressed: () =>
              {Navigator.popAndPushNamed(context, EventScreen.routeName)},
        ),
        MenuTitleWidget(
          title: MenuTitleList.ABOUT_US.value,
          onButtonPressed: () =>
              {Navigator.popAndPushNamed(context, AboutUsScreen.routeName)},
        ),
      ],
    );
  }
}
