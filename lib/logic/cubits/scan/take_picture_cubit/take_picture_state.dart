part of 'take_picture_cubit.dart';

@immutable
abstract class TakePictureState {}

class TakePictureInitial extends TakePictureState {}

class CameraTakePictureLoadingState extends TakePictureState {}

class CameraTakePictureSuccessState extends TakePictureState {
  final XFile image;

  CameraTakePictureSuccessState({
    required this.image,
  });
}

class CameraTakePictureErrorState extends TakePictureState {
  final String errorMessage;

  CameraTakePictureErrorState({
    required this.errorMessage,
  });
}