import 'package:clean_arch/common/bloc/button/button_state.dart';
import 'package:clean_arch/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonStateInitial());
  void excute({dynamic params, required Usecase usecase}) async {
    try {
      emit(ButtonStateLoading());
      Either result = await usecase.call(params);
      result.fold((error) {
        emit(ButtonStateError(errorMessage: error));
      }, (data) {
        emit(ButtonStateSuccess());
      });
    } catch (e) {
      emit(ButtonStateError(errorMessage: e.toString()));
    }
  }
}
