import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litterflow_app/constants/images.dart';

import '../../../data/cache_helper/cache_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> verify() async {
    bool? isGuide = CacheHelper.getData(key: 'isGuide');
    if (isGuide == null) {
      await CacheHelper.saveData(key: 'isGuide', value: false);
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.pushNamed(context, '/guide');
      });
    } else {
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.pushNamed(context, '/layout');
      });
    }
  }

  @override
  void initState()  {
    super.initState();
    verify();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.loose,
          children: [
            Image.asset(
              SplashImages.splashBackground,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              left: MediaQuery.of(context).size.width / 3.5,
              right: MediaQuery.of(context).size.width / 3.5,
              bottom: 0,
              top: 0,
              child: SvgPicture.asset(
                GlobalImages.logo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
