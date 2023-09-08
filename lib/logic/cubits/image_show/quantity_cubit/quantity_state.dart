part of 'quantity_cubit.dart';

@immutable
abstract class QuantityState {}

class QuantityInitial extends QuantityState {}

class QuantityClicked extends QuantityState {
  final String quantity;

  QuantityClicked({required this.quantity});
}
