part of 'camera_bloc.dart';

@immutable
abstract class CameraEvent {}

class InitializeCameraEvent extends CameraEvent {}

class TakePictureEvent extends CameraEvent {}