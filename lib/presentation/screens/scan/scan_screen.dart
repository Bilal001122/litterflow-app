import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:litterflow_app/logic/blocs/camera_bloc/camera_bloc.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CameraBloc>(context).add(InitializeCameraEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CameraBloc, CameraState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          body: state is CameraSuccessState ? CameraPreview(
            state.controller,
          ) : const Center(child: CircularProgressIndicator(),),
        );
      },
    );
  }
}
