part of 'camera_bloc.dart';

@immutable
abstract class CameraState {}

class CameraInitial extends CameraState {}

class CameraLoadingState extends CameraState {}

class CameraSuccessState extends CameraState {
  final CameraController controller;

  CameraSuccessState({
    required this.controller,
  });
}

class CameraErrorState extends CameraState {
  final String errorMessage;

  CameraErrorState({
    required this.errorMessage,
  });
}
