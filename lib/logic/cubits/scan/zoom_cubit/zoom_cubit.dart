import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:meta/meta.dart';

part 'zoom_state.dart';

class ZoomCubit extends Cubit<ZoomState> {
  ZoomCubit() : super(ZoomInitial());

  void changeZoom(int zoom, CameraController cameraController) {
    cameraController.setZoomLevel(zoom.toDouble());
    emit(ZoomSuccess(zoom));
  }
}
