import 'package:flutter/cupertino.dart';

import '../../common/routes.dart';

class SurgeryInfo extends StatelessWidget {
  const SurgeryInfo({super.key});

  static const routeName = '/menu/surgery-info';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as MenuScreenArguments;

    return Text(args.menuTitle);
  }
}
