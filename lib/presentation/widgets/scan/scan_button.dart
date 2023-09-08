import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:litterflow_app/constants/colors.dart';
import 'package:litterflow_app/logic/blocs/scan/camera_bloc/camera_bloc.dart';
import 'package:litterflow_app/logic/cubits/scan/flash_cubit/flash_cubit.dart';
import '../../../logic/cubits/scan/take_picture_cubit/take_picture_cubit.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TakePictureCubit, TakePictureState>(
      listener: (context, state) {
        if (state is CameraTakePictureSuccessState) {
          Navigator.pushNamed(context, '/image_show');
        }
      },
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
                            await BlocProvider.of<TakePictureCubit>(context)
                                .takePicture(controller: state.controller);

                            await BlocProvider.of<FlashCubit>(context)
                                .changeFlash(
                                    isFlashOn: false,
                                    controller: state.controller);
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
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        );
      },
    );
  }
}
