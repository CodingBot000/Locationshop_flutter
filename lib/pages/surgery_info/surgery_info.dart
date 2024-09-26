import 'package:flutter/material.dart';
import 'package:location_shop/server/dump_respository.dart';

import '../../common/route_arguments.dart';
import '../../component/top_app_bar_sub.dart';

class SurgeryInfo extends StatelessWidget {
  const SurgeryInfo({super.key});

  static const routeName = '/menu/surgery-info';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as MenuScreenArguments;
    String title = args.menuTitle;
    // if (title.contains('surgery_')) {
    //   title = title.replaceAll('surgery_', '');
    // } else {
    //   title = title.replaceAll('cosmetic_', '');
    // }

    var surgeryData = DataRepository.getSurgeryDataByName(title);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: TopAppBarSub(title: args.menuTitle),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(args.menuTitle,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              surgeryData.surgeryImgs.isNotEmpty
                  ? Image.asset(surgeryData.surgeryImgs[0])
                  : const SizedBox(
                      height: 200,
                      child: Center(
                        child: Text(
                          "No image available",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(18.20),
                child: Text(
                  surgeryData.surgeryDesc,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ));
  }
}
