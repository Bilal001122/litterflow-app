import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/icons.dart';
import '../../../constants/images.dart';
import '../../../constants/strings.dart';

class FirstSlide extends StatelessWidget {
  const FirstSlide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Transform.translate(
            offset: const Offset(20, 10),
            child: Row(
              children: [
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/layout');
                  },
                  child: const Text(
                    SlidesStrings.skipButton,
                    style: TextStyle(
                      color: AppColors.kSecondaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                SlidesStrings.slide1Title,
                style: TextStyle(
                  color: AppColors.kSecondaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.kPrimaryColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  MyIcons.scan,
                  color: AppColors.kWhiteColor,
                ),
              ),
            ],
          ),
          Image.asset(
            GuideImages.firstSlideImage,
            fit: BoxFit.cover,
          ),
          const Text(
            SlidesStrings.slide1Subtitle,
            style: TextStyle(
              color: AppColors.kSecondaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
