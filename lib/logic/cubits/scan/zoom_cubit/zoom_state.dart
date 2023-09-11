part of 'zoom_cubit.dart';

@immutable
abstract class ZoomState {}

class ZoomInitial extends ZoomState {}

class ZoomSuccess extends ZoomState {
  final int zoom;

  ZoomSuccess(this.zoom);
}
