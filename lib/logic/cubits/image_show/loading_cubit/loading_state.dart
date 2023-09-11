part of 'loading_cubit.dart';

@immutable
abstract class LoadingState {}

class LoadingInitial extends LoadingState {}

class LoadingInProgress extends LoadingState {}

class LoadingSuccess extends LoadingState {}
