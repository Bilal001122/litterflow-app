import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:litterflow_app/constants/colors.dart';
import 'package:litterflow_app/logic/blocs/scan/camera_bloc/camera_bloc.dart';
import 'package:litterflow_app/logic/cubits/scan/flash_cubit/flash_cubit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../logic/cubits/scan/take_picture_cubit/take_picture_cubit.dart';

class ScanButton extends StatefulWidget {
  const ScanButton({
    super.key,
  });

  @override
  State<ScanButton> createState() => _ScanButtonState();
}

class _ScanButtonState extends State<ScanButton> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TakePictureCubit, TakePictureState>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocConsumer<CameraBloc, CameraState>(
          listener: (context, state) {},
          builder: (context, state) {
            return state is CameraSuccessState
                ? Container(
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
                          onTap: () async {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                backgroundColor: AppColors.kPrimaryColor,
                                content: Text('En cours de traitement...'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                            final image = await state.controller.takePicture();
                            if (!mounted) return;
                            await BlocProvider.of<TakePictureCubit>(context)
                                .takePicture(image: image);
                            if (!mounted) return;
                            await BlocProvider.of<FlashCubit>(context)
                                .changeFlash(
                                    isFlashOn: false,
                                    controller: state.controller);
                            if (!mounted) return;
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
                  )
                : Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                        color: AppColors.kPrimaryColor, size: 30),
                  );
          },
        );
      },
    );
  }
}
