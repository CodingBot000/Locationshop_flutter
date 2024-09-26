import 'package:flutter/material.dart';
import 'package:location_shop/common/route_arguments.dart';
import 'package:location_shop/component/chips_menu.dart';
import 'package:location_shop/data/chip_location_data.dart';
import 'package:location_shop/pages/about_us/about_us.dart';
import 'package:location_shop/pages/event_screen/event_screen.dart';
import 'package:location_shop/pages/favorite_screen/favorite_screen.dart';
import 'package:location_shop/pages/location_screen/location_screen.dart';
import 'package:location_shop/pages/surgery_info/surgery_info.dart';

import '../../common/enums.dart';
import 'menu_title.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  static const routeName = '/menu';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(height: 50),
          MenuTitleWidget(title: MenuTitleList.SURGICAL_PROCEDURE.value),
          ChipsMenu(
              onButtonPressed: (String chip) {
                Navigator.pushNamed(
                  context,
                  SurgeryInfo.routeName,
                  arguments: MenuScreenArguments(chip),
                );
              },
              mainMenuName: MenuTitleList.SURGICAL_PROCEDURE,
              chipsList: SurgeryResList.namesList()),
          SizedBox(height: 10),
          MenuTitleWidget(title: MenuTitleList.COSMETIC_PROCEDURE.value),
          ChipsMenu(
              onButtonPressed: (String chip) {
                Navigator.pushNamed(
                  context,
                  SurgeryInfo.routeName,
                  arguments: MenuScreenArguments(chip),
                );
              },
              mainMenuName: MenuTitleList.COSMETIC_PROCEDURE,
              chipsList: CosmeticResList.namesList()),
          SizedBox(height: 10),
          MenuTitleWidget(title: MenuTitleList.LOCATION.value),
          ChipsMenu(
              onButtonPressed: (String location) {
                LocationChipData? locationData;
                for (var locationName in LocationNames.values) {
                  if (locationName.value == location) {
                    locationData = LocationChipData(
                        region: locationName,
                        isSelected: true);
                    break;
                  }
                }

                locationData ??= LocationChipData(
                      region: LocationNames.APGUJEONG,
                      isSelected: true);

                Navigator.popAndPushNamed(
                  context,
                  LocationScreen.routeName,
                  arguments: MenuScreenLocationArguments(locationData),
                );
              },
              mainMenuName: MenuTitleList.LOCATION,
              chipsList: LocationNames.namesList()),
          SizedBox(height: 10),
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
      ),
    );
  }
}
