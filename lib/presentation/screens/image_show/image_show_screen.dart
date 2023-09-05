import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:litterflow_app/logic/cubits/scan/take_picture_cubit/take_picture_cubit.dart';

class ImageShowScreen extends StatelessWidget {
  const ImageShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<TakePictureCubit, TakePictureState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state is CameraTakePictureSuccessState
            ? Center(
                child: Image.file(
                  File(state.image.path),
                  fit: BoxFit.cover,
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    ));
  }
}
