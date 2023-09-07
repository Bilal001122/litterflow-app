import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class CustomRadioButtons extends StatefulWidget {
  const CustomRadioButtons({
    super.key,
  });

  @override
  State<CustomRadioButtons> createState() => _CustomRadioButtonsState();
}

class _CustomRadioButtonsState extends State<CustomRadioButtons> {
  String selectedQuantity = '0 à 10';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: AppColors.kFourthColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.kSecondaryColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: '0 à 10',
                groupValue: selectedQuantity,
                activeColor: AppColors.kSecondaryColor,
                fillColor: MaterialStateProperty.all<Color>(
                    AppColors.kSecondaryColor),
                onChanged: (value) {
                  setState(() {
                    selectedQuantity = value.toString();
                  });
                },
              ),
              const Text(
                '0 à 10',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kSecondaryColor,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: '10 à 20',
                groupValue: selectedQuantity,
                activeColor: AppColors.kSecondaryColor,
                fillColor: MaterialStateProperty.all<Color>(
                    AppColors.kSecondaryColor),
                onChanged: (value) {
                  setState(() {
                    selectedQuantity = value.toString();
                  });
                },
              ),
              const Text(
                '10 à 20',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kSecondaryColor,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: '> 20',
                groupValue: selectedQuantity,
                activeColor: AppColors.kSecondaryColor,
                fillColor: MaterialStateProperty.all<Color>(
                    AppColors.kSecondaryColor),
                onChanged: (value) {
                  setState(() {
                    selectedQuantity = value.toString();
                  });
                },
              ),
              const Text(
                '> 20',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kSecondaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
