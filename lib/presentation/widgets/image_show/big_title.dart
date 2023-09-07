import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litterflow_app/constants/colors.dart';
import 'package:litterflow_app/constants/images.dart';

class BigTitle extends StatelessWidget {
  final String title;
  final String subTitle;

  const BigTitle({
    super.key, required this.title, required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ScanImages.waveImage,
              width: 20,
              height: 20,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'MontserratAlternates',
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                color: AppColors.kSecondaryColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          subTitle,
          style: TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.w500,
            color: AppColors
                .kSecondaryColor
                .withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
