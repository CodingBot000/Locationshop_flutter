import 'package:flutter/material.dart';
import 'package:location_shop/server/dump_respository.dart';

import '../../common/route_arguments.dart';
import '../../component/top_app_bar_sub.dart';

class HospitalDetailScreen extends StatefulWidget {
  const HospitalDetailScreen({super.key});

  static const routeName = '/hospital-detail';

  @override
  State<HospitalDetailScreen> createState() => _HospitalDetailScreenState();
}

class _HospitalDetailScreenState extends State<HospitalDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as HosptialDetailArguments;
    var data = DataRepository.getHospitalDetailInfoById(args.id);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: TopAppBarSub(title: HospitalDetailScreen.routeName),
        body:
        data != null ? EmptyView()
        : Text(data!.productName[0])

    );
  }


  Widget EmptyView() {
    return const SizedBox(
      height: 200,
      child: Center(
        child: Text(
          "Empty Data",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}