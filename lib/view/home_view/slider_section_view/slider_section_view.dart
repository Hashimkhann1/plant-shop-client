
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderSectionView extends StatefulWidget {
  const SliderSectionView({super.key});

  @override
  State<SliderSectionView> createState() => _SliderSectionViewState();
}

class _SliderSectionViewState extends State<SliderSectionView> {
  int activeIndex = 0;

  final List<String> imagesUrl = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi7kGGM0HDvdFAwTqZGMimBMkLG2WcP8GTZw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi7kGGM0HDvdFAwTqZGMimBMkLG2WcP8GTZw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi7kGGM0HDvdFAwTqZGMimBMkLG2WcP8GTZw&s'
  ];

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Stack(children: [
      CarouselSlider.builder(
          itemCount: imagesUrl.length,
          itemBuilder: (context, index, relIndex) {
            return Container(
              width: width,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(6)),
              child: Image.network(
                imagesUrl[index],
                fit: BoxFit.cover,
              ),
            );
          },
          options: CarouselOptions(
              height: height * 0.44,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              viewportFraction: 0.8,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              onPageChanged: (changeIndex, reason) {
                setState(() {
                  activeIndex = changeIndex;
                });
              })),
      Positioned(
        bottom: 20,
        left: width * 0.5,
        child: AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: imagesUrl.length,
          duration: const Duration(milliseconds: 500),
          effect: const WormEffect(
              dotColor: Colors.white, activeDotColor: Colors.greenAccent),
        ),
      )
    ]);
  }
}
