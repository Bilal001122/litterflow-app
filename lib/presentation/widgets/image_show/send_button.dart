import 'package:flutter/material.dart';
import 'package:litterflow_app/constants/colors.dart';

import '../../../constants/strings.dart';

class SendButton extends StatelessWidget {
  const SendButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 10.0,bottom: 10.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.kPrimaryColor.withOpacity(0.4),
                blurRadius: 20.0,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              backgroundColor: AppColors.kPrimaryColor,
              foregroundColor: AppColors.kWhiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () {

            },
            child: const Text(
              ScanStrings.sendButton,
              style: TextStyle(
                fontFamily: 'MontserratAlternates',
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: AppColors.kWhiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
