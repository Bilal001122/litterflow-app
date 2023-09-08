part of 'type_cubit.dart';

@immutable
abstract class TypeState {}

class TypeInitial extends TypeState {}


class TypeClicked extends TypeState {
  final String type;

  TypeClicked({required this.type});
}