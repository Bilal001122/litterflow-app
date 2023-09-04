part of 'flash_cubit.dart';

@immutable
abstract class FlashState {}

class FlashInitial extends FlashState {}

class FlashOnState extends FlashState {
  final bool isFlashOn;
  final CameraController controller;
  FlashOnState(this.isFlashOn, this.controller);
}
