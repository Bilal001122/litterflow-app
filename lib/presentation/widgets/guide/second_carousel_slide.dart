import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litterflow_app/constants/colors.dart';
import 'package:litterflow_app/constants/icons.dart';
import 'package:litterflow_app/constants/images.dart';
import 'package:litterflow_app/constants/strings.dart';

class SecondSlide extends StatelessWidget {
  const SecondSlide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 32.0,
        right: 32.0,
        bottom: 80,
      ),
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
          const Text(
            SlidesStrings.slide2Title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.kSecondaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          Image.asset(
            GuideImages.secondSlideImage12,
            fit: BoxFit.fitWidth,
          ),
          const Text(
            SlidesStrings.slide2Subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.kSecondaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          SvgPicture.asset(
            GuideImages.secondSlideImage2,
            fit: BoxFit.fitWidth,
          ),
          Row(
            children: const [
              Icon(
                MyIcons.help,
                color: AppColors.kPrimaryColor,
              ),
              SizedBox(
                width: 1,
              ),
              Expanded(
                child: Text(
                  maxLines: 2,
                  SlidesStrings.slide2Hint,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.kSecondaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 9,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
