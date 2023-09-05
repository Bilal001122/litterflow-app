import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/blocs/scan/camera_bloc/camera_bloc.dart';

class ImageShowScreen extends StatelessWidget {
  const ImageShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<CameraBloc, CameraState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            return state is CameraTakePictureSuccessState ?  Center(
              child: Image.file(
                File(state.image.path),
                fit: BoxFit.cover,
              ),
            ) : Container();
          },
        )
    );
  }
}
