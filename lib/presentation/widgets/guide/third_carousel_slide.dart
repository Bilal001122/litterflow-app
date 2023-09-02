import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants/colors.dart';
import '../../../constants/images.dart';
import '../../../constants/strings.dart';

class ThirdSlide extends StatelessWidget {
  const ThirdSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 40, top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            SlidesStrings.slide3Title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.kSecondaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.kPrimaryColor.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: SvgPicture.asset(
              GuideImages.thirdSlideImage1,
              fit: BoxFit.fitWidth,
            ),
          ),
          Row(
            children: [
              const Expanded(
                child: Text(
                  SlidesStrings.slide3Subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.kSecondaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                width: 1,
              ),
              Image.asset(
                GuideImages.thirdSlideImage2,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.kPrimaryColor.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.kSecondaryColor,
                backgroundColor: AppColors.kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/layout');
              },
              child: Text(
                SlidesStrings.goButton.toUpperCase(),
                style: const TextStyle(
                  color: AppColors.kWhiteColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
