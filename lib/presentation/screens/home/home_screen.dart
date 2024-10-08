import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litterflow_app/constants/colors.dart';
import 'package:litterflow_app/constants/images.dart';
import 'package:litterflow_app/constants/strings.dart';
import 'package:litterflow_app/data/firebase/firebase_service.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../widgets/home/home_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(250.0, 200),
                      bottomRight: Radius.elliptical(250.0, 200)),
                  color: AppColors.kSecondaryColor,
                ),
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 20,
                      child: SvgPicture.asset(
                        GlobalImages.logoWhite,
                      ),
                    ),
                    const Positioned(
                      child: HomeCarousel(),
                    ),
                    Positioned(
                      left: 0,
                      top: 50,
                      child: SvgPicture.asset(GlobalImages.wave1),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 5,
                      child: SvgPicture.asset(GlobalImages.wave2),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(GlobalImages.homeIcon),
                  ),
                  const Text(
                    HomeStrings.title,
                    style: TextStyle(
                      color: AppColors.kSecondaryColor,
                      fontFamily: 'MontserratAlternates',
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        HomeStrings.alertes,
                        style: TextStyle(
                          color: AppColors.kSecondaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.only(bottom: 15),
                      child: FutureBuilder(
                        future: FirebaseDataBase.getGarbageCount(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.data.toString(),
                              style: const TextStyle(
                                color: AppColors.kSecondaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            );
                          }
                          return Center(
                            child: LoadingAnimationWidget.staggeredDotsWave(
                              color: AppColors.kPrimaryColor,
                              size: 30,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
