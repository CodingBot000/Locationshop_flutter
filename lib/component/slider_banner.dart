import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:location_shop/common/init_value.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderBanner extends StatefulWidget {
  const SliderBanner({super.key});

  @override
  State<SliderBanner> createState() => _SliderBannerState();
}

class _SliderBannerState extends State<SliderBanner> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topCenter, children: <Widget>[
      CarouselSlider.builder(
        options: CarouselOptions(
          height: 300,
          initialPage: 0,
          viewportFraction: 1,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          enlargeCenterPage: true,
          onPageChanged: (index, reason) => setState(() {
            activeIndex = index;
          }),
        ),
        itemCount: InitValue.homeBannerDatas.length,
        itemBuilder: (context, index, realIndex) {
          final path = InitValue.homeBannerDatas[index].urlImg;
          return imageSlider(path, index);
        },
      ),
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: indicator(),
      ),
    ]);
  }

  Widget imageSlider(path, index) => Container(
        width: double.infinity,
        height: 240,
        color: Colors.grey,
        child: Image.asset(path,
            fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.error,
              size: 240,
              color: Colors.red,
            );
          },),
      );

  Widget indicator() => Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      alignment: Alignment.bottomCenter,
      child: AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: InitValue.homeBannerDatas.length,
        effect: JumpingDotEffect(
            dotHeight: 6,
            dotWidth: 6,
            activeDotColor: Colors.white,
            dotColor: Colors.white.withOpacity(0.6)),
      ));
}
