import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'take_picture_state.dart';

class TakePictureCubit extends Cubit<TakePictureState> {
  TakePictureCubit() : super(TakePictureInitial());

  Future<void> takePicture({required CameraController controller}) async {
    emit(CameraTakePictureLoadingState());
    try {
      final image = await controller.takePicture();
      emit(CameraTakePictureSuccessState(image: image));
    } catch (error) {
      if (kDebugMode) {
        print('The error :${error.toString()}');
      }
      emit(CameraTakePictureErrorState(errorMessage: error.toString()));
    }
  }

}
