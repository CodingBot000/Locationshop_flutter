import 'package:flutter/material.dart';
import 'package:location_shop/common/route_arguments.dart';
import 'package:location_shop/component/chips_menu.dart';
import 'package:location_shop/model/chip_location_data.dart';
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
          const SizedBox(height: 50),
          MenuTitleWidget(title: MenuTitleList.surgicalProcedure.value),
          ChipsMenu(
              onButtonPressed: (String chip) {
                Navigator.pushNamed(
                  context,
                  SurgeryInfo.routeName,
                  arguments: MenuScreenArguments(chip),
                );
              },
              mainMenuName: MenuTitleList.surgicalProcedure,
              chipsList: SurgeryResList.namesList()),
          const SizedBox(height: 10),
          MenuTitleWidget(title: MenuTitleList.cosmeticProcedure.value),
          ChipsMenu(
              onButtonPressed: (String chip) {
                Navigator.pushNamed(
                  context,
                  SurgeryInfo.routeName,
                  arguments: MenuScreenArguments(chip),
                );
              },
              mainMenuName: MenuTitleList.cosmeticProcedure,
              chipsList: CosmeticResList.namesList()),
          const SizedBox(height: 10),
          MenuTitleWidget(title: MenuTitleList.location.value),
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
                      region: LocationNames.ApguJeong,
                      isSelected: true);

                Navigator.popAndPushNamed(
                  context,
                  LocationScreen.routeName,
                  arguments: MenuScreenLocationArguments(locationData),
                );
              },
              mainMenuName: MenuTitleList.location,
              chipsList: LocationNames.namesList()),
          const SizedBox(height: 10),
          MenuTitleWidget(
            title: MenuTitleList.favorite.value,
            onButtonPressed: () =>
                {Navigator.popAndPushNamed(context, FavoriteScreen.routeName)},
          ),
          MenuTitleWidget(
            title: MenuTitleList.event.value,
            onButtonPressed: () =>
                {Navigator.popAndPushNamed(context, EventScreen.routeName)},
          ),
          MenuTitleWidget(
            title: MenuTitleList.aboutUs.value,
            onButtonPressed: () =>
                {Navigator.popAndPushNamed(context, AboutUsScreen.routeName)},
          ),
        ],
      ),
    );
  }
}
