import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../server/dump_respository.dart';

class BannerSlider extends StatefulWidget {
  BannerSlider({super.key, required this.activeIndex});

  int activeIndex;

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(alignment: Alignment.topCenter, children: <Widget>[
        CarouselSlider.builder(
          options: CarouselOptions(
            initialPage: 0,
            viewportFraction: 1,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) => setState(() {
              widget.activeIndex = index;
            }),
          ),
          itemCount: DataRepository.homeBannerDatas.length,
          itemBuilder: (context, index, realIndex) {
            final path = DataRepository.homeBannerDatas[index].urlImg;
            return imageSlider(path, index);
          },
        ),
        Align(alignment: Alignment.bottomCenter, child: indicator())
      ]),
    );
  }

  Widget imageSlider(path, index) => Container(
        width: double.infinity,
        height: 240,
        color: Colors.grey,
        child: Image.asset(path, fit: BoxFit.cover),
      );

  Widget indicator() => Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      alignment: Alignment.bottomCenter,
      child: AnimatedSmoothIndicator(
        activeIndex: widget.activeIndex,
        count: DataRepository.homeBannerDatas.length,
        effect: JumpingDotEffect(
            dotHeight: 6,
            dotWidth: 6,
            activeDotColor: Colors.white,
            dotColor: Colors.white.withOpacity(0.6)),
      ));
}
