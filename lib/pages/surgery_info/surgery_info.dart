import 'package:flutter/material.dart';
import 'package:location_shop/repository/respository.dart';

import '../../common/init_value.dart';
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

    var surgeryData = InitValue.getSurgeryDataByName(title);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: TopAppBarSub(title: args.menuTitle),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                args.menuTitle,
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              surgeryData.surgeryImgs.isNotEmpty
                  ? Image.asset(
                      surgeryData.surgeryImgs[0],
                      height: 300,
                      fit: BoxFit.fitHeight,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.error,
                          size: 300,
                          color: Colors.red,
                        );
                      },
                    )
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
