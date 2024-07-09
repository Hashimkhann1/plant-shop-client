
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:plant_cli/utils/responsive/responsive.dart';
import 'package:plant_cli/utils/view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderSectionView extends StatefulWidget {
  const SliderSectionView({super.key});

  @override
  State<SliderSectionView> createState() => _SliderSectionViewState();
}

class _SliderSectionViewState extends State<SliderSectionView> {
  int activeIndex = 0;

  final List<String> imagesUrl = [
    // 'https://raw.githubusercontent.com/Hashimkhann1/plant_shop/main/images/3.png',
    // 'https://raw.githubusercontent.com/Hashimkhann1/plant_shop/main/images/1.png',
    // 'https://raw.githubusercontent.com/Hashimkhann1/plant_shop/main/images/4.png',
    // 'https://raw.githubusercontent.com/Hashimkhann1/plant_shop/main/images/2.png',
    '3',
    '1',
    '4',
    '2',
  ];

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Stack(children: [
      CarouselSlider.builder(
          itemCount: imagesUrl.length,
          itemBuilder: (context, index, relIndex) {
            // print(imagesUrl.length);
            return Container(
              width: width,
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(6)),
              child: Image.asset(
                'images/slider/${imagesUrl[index]}.png',
                // imagesUrl[index].toString(),
                fit: BoxFit.cover,
              ),
            );
          },
          options: CarouselOptions(
              height: Responsive.isMobile(context) ? height * 0.23 : Responsive.isTablet(context) ? height * 0.28 : height * 0.40,
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
          effect: WormEffect(
              dotColor: Colors.white, activeDotColor: Colors.greenAccent,dotHeight: Responsive.isMobile(context) ? 12 : 16,dotWidth: Responsive.isMobile(context) ? 12 : 16,),
        ),
      )
    ]);
  }
}
