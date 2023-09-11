
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:litterflow_app/constants/colors.dart';
import 'package:litterflow_app/logic/blocs/scan/camera_bloc/camera_bloc.dart';
import 'package:litterflow_app/logic/cubits/scan/flash_cubit/flash_cubit.dart';


class FlashButton extends StatelessWidget {

  final CameraSuccessState cameraSuccessState;

  const FlashButton({
    super.key, required this.cameraSuccessState,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await BlocProvider.of<FlashCubit>(context)
            .changeFlash(
          isFlashOn:
          cameraSuccessState.controller.value.flashMode ==
              FlashMode.off
              ? true
              : false,
          controller: cameraSuccessState.controller,
        );
      },
      icon: BlocConsumer<FlashCubit, FlashState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is FlashOnState
              ? Icon(
            state.controller.value.flashMode ==
                FlashMode.torch
                ? Icons.flash_on_rounded
                : Icons.flash_off_rounded,
            color: AppColors.kWhiteColor,
          )
              : const SizedBox();
        },
      ),
    );
  }
}