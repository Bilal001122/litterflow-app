import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:litterflow_app/constants/images.dart';
import 'package:litterflow_app/presentation/widgets/guide/custom_carousel.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.loose,
          children: [
            SvgPicture.asset(
              GuideImages.guideBackground,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 30),
                child: ImageSwipe(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}