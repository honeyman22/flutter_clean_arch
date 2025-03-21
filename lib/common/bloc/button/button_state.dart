abstract class ButtonState {}

class ButtonStateInitial extends ButtonState {}

class ButtonStateLoading extends ButtonState {}

class ButtonStateSuccess extends ButtonState {}

class ButtonStateError extends ButtonState {
  final String errorMessage;

  ButtonStateError({required this.errorMessage});
}
