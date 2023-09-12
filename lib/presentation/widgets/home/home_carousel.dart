import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:litterflow_app/constants/colors.dart';
import 'package:litterflow_app/constants/strings.dart';

class HomeCarousel extends StatefulWidget {
  static final List<String> titles = [
    HomeStrings.carousel1Title,
    HomeStrings.carousel2Title,
    HomeStrings.carousel3Title,
    HomeStrings.carousel4Title,
    HomeStrings.carousel5Title
  ];
  static final List<String> subTitles = [
    HomeStrings.carousel1Subtitle,
    HomeStrings.carousel2Subtitle,
    HomeStrings.carousel3Subtitle,
    HomeStrings.carousel4Subtitle,
    HomeStrings.carousel5Subtitle
  ];

  const HomeCarousel({
    Key? key,
  }) : super(key: key);


  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [0, 1, 2, 3, 4].map((i) {
        return Center(
          child: Container(
            width: 250,
            decoration: BoxDecoration(
              color: const Color(0xffe7ebf3).withOpacity(0.15),
              borderRadius: BorderRadius.circular(32),
              border: Border.all(
                color: Colors.white.withOpacity(0.15),
                width: 0.5,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        HomeCarousel.titles.elementAt(i),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.kWhiteColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'MontserratAlternates',

                        ),
                      ),

                    ),
                  ),

                  Center(

                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                      color: AppColors.kWhiteColor,
                      width: 180,
                      height: 1,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        HomeCarousel.subTitles.elementAt(i),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.kWhiteColor.withOpacity(0.6),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          //fontFamily: 'MontserratAlternates',
                        ),
                        softWrap: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 250,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
      ),
    );
  }
}
