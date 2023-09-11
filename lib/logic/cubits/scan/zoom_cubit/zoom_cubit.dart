import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:meta/meta.dart';

part 'zoom_state.dart';

class ZoomCubit extends Cubit<ZoomState> {
  ZoomCubit() : super(ZoomInitial());

  Future<void> changeZoom(int zoom, CameraController cameraController) async {
    await cameraController.setZoomLevel(zoom.toDouble());
    emit(ZoomSuccess(zoom));
  }
}
