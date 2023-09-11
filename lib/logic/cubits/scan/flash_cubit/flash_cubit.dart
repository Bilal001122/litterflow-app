import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:meta/meta.dart';

part 'flash_state.dart';

class FlashCubit extends Cubit<FlashState> {
  FlashCubit() : super(FlashInitial());

  Future<void> changeFlash({
    required bool isFlashOn,
    required CameraController controller,
  }) async {
    await controller.setFlashMode(isFlashOn ? FlashMode.torch : FlashMode.off);
    emit(FlashOnState(isFlashOn, controller));
  }
}
