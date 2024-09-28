import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderImage extends StatefulWidget {
  SliderImage({super.key, required this.imageList});
  List<String> imageList;


  @override
  State<SliderImage> createState() => _SliderImageState();
}

class _SliderImageState extends State<SliderImage> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topCenter, children: <Widget>[
      CarouselSlider.builder(
        options: CarouselOptions(
          initialPage: 0,
          viewportFraction: 1,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) => setState(() {
            activeIndex = index;
          }),
        ),
        itemCount: widget.imageList.length,
        itemBuilder: (context, index, realIndex) {
          final path = widget.imageList[index];
          return imageSlider(path, index);
        },
      ),
      Align(alignment: Alignment.bottomCenter, child: indicator())
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
        count: widget.imageList.length,
        effect: JumpingDotEffect(
            dotHeight: 6,
            dotWidth: 6,
            activeDotColor: Colors.white,
            dotColor: Colors.white.withOpacity(0.6)),
      ));
}
