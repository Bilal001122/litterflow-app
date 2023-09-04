import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/colors.dart';
import '../../../logic/cubits/scan/zoom_cubit/zoom_cubit.dart';

class ZoomButton extends StatelessWidget {
  final int zoom;
  final String text;
  final CameraController controller;

  const ZoomButton(
      {super.key,
      required this.zoom,
      required this.text,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ZoomCubit, ZoomState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state is ZoomSuccess
            ? TextButton(
                style: TextButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: state.zoom == zoom
                      ? AppColors.kPrimaryColor.withOpacity(0.8)
                      : Colors.grey[800]?.withOpacity(0.8),
                  maximumSize: const Size(30, 30),
                  minimumSize: const Size(30, 30),
                  shape: CircleBorder(
                    side: BorderSide(
                      color: Colors.grey[300]!.withOpacity(0.8),
                      width: 2,
                    ),
                  ),
                ),
                onPressed: () async {
                  BlocProvider.of<ZoomCubit>(context)
                      .changeZoom(zoom, controller);
                },
                child: Text(
                  text,
                  style: const TextStyle(
                      color: AppColors.kWhiteColor, fontSize: 10),
                ),
              )
            : const SizedBox();
      },
    );
  }
}
