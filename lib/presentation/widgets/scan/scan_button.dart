import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:litterflow_app/constants/colors.dart';
import 'package:litterflow_app/logic/blocs/scan/camera_bloc/camera_bloc.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CameraBloc, CameraState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.kWhiteColor,
              width: 2,
            ),
          ),
          child: Transform.scale(
            scale: 0.9,
            child: Material(
              color: AppColors.kWhiteColor,
              type: MaterialType.circle,
              child: InkWell(
                onTap: () {
                  BlocProvider.of<CameraBloc>(context).add(
                    TakePictureEvent(),
                  );
                  Navigator.pushNamed(context, '/image_show');
                },
                splashColor: AppColors.kPrimaryColor.withOpacity(0.2),
                customBorder: const CircleBorder(),
                child: Container(
                  margin: const EdgeInsets.all(3),
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
