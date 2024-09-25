import 'package:flutter/material.dart';
import 'package:location_shop/component/top_app_bar_sub.dart';

import '../../common/routes.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  static const routeName = '/about-us';

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as MenuScreenArguments;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: TopAppBarSub(title: "About Us"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.10),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(contents,
                style: TextStyle(fontSize: 15))
              ],
            ),
          ),
        ));
  }

  final String title =
      "Purpose of BeuatyU is to make all process simple for you.";
  final String contents = '''
  1) Reservation :
   Users can search and make reservation(clinics and plastic surgery).
  BeautyU provide information of Beauty specialist’s profile and service they offer.
  BeuatyU make all this process simple.

  2) Information :
   BeautyU provide newly beauty trend, make-up tips, skin-care methods and other useful informations.
  Popular beauty celebrity can provide ideal products, tips and know-how in BeautyU . Users can make there own decision based on informations beauty experts directly provide.

  3) Cummunation :
   Users can share their vivid experience and know-hows. Users can communicate and share their various knowledge within BeautyU.

  4) Events and Discounts :
   BeautyU provide newly events and various information of discounts. BeautyU also provide gifts for users.

  5) Customized for individuals :
   BeautyU provide customized information based on their interest and perference.

  6) Channel : BeautyU connect to channel directly to hospitals and clinics. Users can ask what they are curious about.
  ''';
}
