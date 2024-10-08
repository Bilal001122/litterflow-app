import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:litterflow_app/constants/colors.dart';
import 'package:litterflow_app/constants/icons.dart';
import 'package:litterflow_app/constants/images.dart';
import 'package:litterflow_app/constants/strings.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  //final bool _customIcon = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Positioned(
                    right: 0,
                    top: 10,
                    child: Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      child: SvgPicture.asset(
                        HelpImages.upperWave,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 28,
                    top: 56,
                    child: Text(
                      HelpStrings.helpTitle,
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'MontserratAlternates',
                        color: AppColors.kSecondaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 60,
                    child: SvgPicture.asset(
                      HelpImages.lowerWave,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: HelpStrings.questionAnswers.length,
                padding: const EdgeInsets.all(10.0),
                itemBuilder: (context, index) {
                  return Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      side: BorderSide(
                        color: Color(0xffb0c3d4),
                        width: 0.3,
                        strokeAlign: BorderSide.strokeAlignOutside,
                      ),
                    ),
                    elevation: 0,
                    child: ExpansionTile(
                      leading: SvgPicture.asset(HelpImages.faqIcon),
                      textColor: AppColors.kSecondaryColor,
                      iconColor: AppColors.kSecondaryColor,
                      collapsedIconColor: AppColors.kSecondaryColor,
                      shape: const Border(),
                      title: Text(
                        HelpStrings.questionAnswers
                            .elementAt(index)
                            .values
                            .elementAt(0)
                            .toString(),
                        style: const TextStyle(
                          color: AppColors.kSecondaryColor,
                          fontFamily: 'MontserratAlternates',
                          fontSize: 10.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      expandedAlignment: Alignment.center,
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: SvgPicture.asset(
                            HelpImages.line,
                            width: 300.0,
                          ),
                        ),
                        ListTile(
                          title: Opacity(
                            opacity: 0.7,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                HelpStrings.questionAnswers
                                    .elementAt(index)
                                    .values
                                    .elementAt(1)
                                    .toString(),
                                style: const TextStyle(
                                  color: AppColors.kSecondaryColor,
                                  fontFamily: 'Montserrat',
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      HelpStrings.helpFooter,
                      softWrap: true,
                      maxLines: 3,
                      style: TextStyle(
                        color: AppColors.kSecondaryColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'MontserratAlternates',
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15.0),
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
                        backgroundColor: AppColors.kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/guide');
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 6.0),
                        child: Text(
                          HelpStrings.helpFooterButton,
                          style: TextStyle(
                            color: AppColors.kWhiteColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'MontserratAlternates',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: const Icon(
                          MyIcons.gmail,
                          size: 10.0,
                          color: AppColors.kSecondaryColor,
                        ),
                      ),
                      Text(
                        HelpStrings.email,
                        style: TextStyle(
                          color: AppColors.kSecondaryColor.withOpacity(0.5),
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5.0),
                        child: const Icon(
                          MyIcons.phone,
                          size: 10.0,
                          color: AppColors.kSecondaryColor,
                        ),
                      ),
                      Text(
                        HelpStrings.phoneNumber,
                        style: TextStyle(
                          color: AppColors.kSecondaryColor.withOpacity(0.5),
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
