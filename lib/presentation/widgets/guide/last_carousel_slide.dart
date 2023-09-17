import 'package:flutter/material.dart';
import 'package:litterflow_app/constants/colors.dart';
import 'package:litterflow_app/constants/icons.dart';
import 'package:litterflow_app/constants/images.dart';
import 'package:litterflow_app/constants/strings.dart';

class LastSlide extends StatelessWidget {
  const LastSlide({
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
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              SlidesStrings.lastSlideTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.kSecondaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Image.asset(
              GuideImages.encadrerSlide,
              fit: BoxFit.fitWidth,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                MyIcons.help,
                color: AppColors.kPrimaryColor,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                maxLines: 4,
                SlidesStrings.lastSlideSubtitle,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppColors.kSecondaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 9,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
