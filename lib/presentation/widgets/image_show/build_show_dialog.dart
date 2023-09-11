import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litterflow_app/constants/colors.dart';
import 'package:litterflow_app/constants/images.dart';
import 'package:litterflow_app/constants/strings.dart';

Future<dynamic> buildShowDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        alignment: Alignment.center,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ScanImages.wave2Image, height: 20.0),
            const SizedBox(
              width: 10,
            ),
             const Center(
              child: Text(
                ScanStrings.thanksMessageTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'MontserratAlternates',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.kSecondaryColor,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SvgPicture.asset(ScanImages.wave2Image, height: 20.0),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 1,
              color: AppColors.kSecondaryColor,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              ScanStrings.thanksMessageSubTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: AppColors.kSecondaryColor,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
