import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'quantity_state.dart';

class QuantityCubit extends Cubit<QuantityState> {
  QuantityCubit() : super(QuantityInitial());

  void quantityClicked(String quantity) {
    emit(QuantityClicked(quantity: quantity));
  }
}
