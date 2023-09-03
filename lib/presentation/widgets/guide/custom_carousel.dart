import 'package:flutter/material.dart';
import 'package:litterflow_app/presentation/widgets/guide/first_carousel_slide.dart';
import 'package:litterflow_app/presentation/widgets/guide/second_carousel_slide.dart';
import 'package:litterflow_app/presentation/widgets/guide/third_carousel_slide.dart';
import '../../../constants/colors.dart';

class ImageSwipe extends StatefulWidget {
  final List<Widget> _slides = [
    const FirstSlide(),
    const SecondSlide(),
    const ThirdSlide(),
  ];

  ImageSwipe({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageSwipe> createState() => _ImageSwipeState();
}

class _ImageSwipeState extends State<ImageSwipe> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.kPrimaryColor.withOpacity(0.3),
            offset: const Offset(0, 12),
            blurRadius: 50,
          ),
        ],
      ),
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: widget._slides,
              onPageChanged: (index) {
                setState(() {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutCubic,
                  );
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (int i = 0; i < widget._slides.length; i++)
                      FutureBuilder(
                        future: Future.value(true),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Container();
                          }
                          return AnimatedContainer(
                            duration: const Duration(
                              milliseconds: 300,
                            ),
                            curve: Curves.easeOutCubic,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 2,
                            ),
                            width: _pageController.page?.round() == i ? 20 : 6,
                            height: 6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.kSecondaryColor,
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
