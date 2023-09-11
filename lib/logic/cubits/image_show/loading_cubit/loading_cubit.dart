import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'loading_state.dart';

class LoadingCubit extends Cubit<LoadingState> {
  LoadingCubit() : super(LoadingInitial());

  void loading() {
    emit(LoadingInProgress());
  }

  void loaded() {
    emit(LoadingSuccess());
  }
}
