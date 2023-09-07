import 'package:flutter/material.dart';
import 'package:litterflow_app/constants/colors.dart';
import 'package:litterflow_app/presentation/widgets/image_show/send_button.dart';
import '../../../constants/strings.dart';
import 'big_title.dart';
import 'custom_drop_down_menu.dart';
import 'custom_radio_buttons.dart';
import 'custom_text_field.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 25,bottom: 12),
            decoration: const BoxDecoration(
              color: AppColors.kWhiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  const [
                BigTitle(
                  title: ScanStrings.typeTitle,
                  subTitle: ScanStrings.typeSubTitle,
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomDropDownMenu(),
                SizedBox(
                  height: 40.0,
                ),
                BigTitle(
                  title: ScanStrings.quantityTitle,
                  subTitle: ScanStrings.quantitySubTitle,
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomRadioButtons(),
                SizedBox(
                  height: 40.0,
                ),
                BigTitle(
                  title: ScanStrings.noteTitle,
                  subTitle: ScanStrings.noteSubTitle,
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomTextField(),
                SizedBox(
                  height: 20.0,
                ),
                SendButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}



