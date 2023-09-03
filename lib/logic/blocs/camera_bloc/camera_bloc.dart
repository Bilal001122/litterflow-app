import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'camera_event.dart';

part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  late CameraController _controller;
  late List<CameraDescription> _cameras;
  bool _isCameraInitialized = false;

  CameraBloc() : super(CameraInitial()) {
    on<InitializeCameraEvent>(initializeCameraEvent);
  }

  FutureOr<void> initializeCameraEvent(
      InitializeCameraEvent event, Emitter<CameraState> emit) async {
    emit(CameraLoadingState());
    try {
      await _initializeCamera();
      if (_isCameraInitialized) {
        emit(
          CameraSuccessState(
            controller: _controller,
          ),
        );
      }
    } catch (error) {
      if (kDebugMode) {
        print('The error :${error.toString()}');
      }
      emit(CameraErrorState(errorMessage: error.toString()));
    }
  }

  Future<void> _initializeCamera() async {
    if (await Permission.camera.request().isGranted) {
      _cameras = await availableCameras();
      if (_cameras.isEmpty) {
        _isCameraInitialized = false;
      }
      _controller = CameraController(_cameras[0], ResolutionPreset.max);
      try {
        await _controller.initialize();
        _isCameraInitialized = true;
      } catch (error) {
        _isCameraInitialized = false;
      }
    } else {
      _isCameraInitialized = false;
    }
  }

  @override
  Future<void> close() async {
    _controller.dispose();
    return super.close();
  }
}
