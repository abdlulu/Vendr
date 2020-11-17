part of 'sign_in_validation_bloc_.dart';

@immutable
abstract class SignInValidationState {}

class SignInValidationInitial extends SignInValidationState {}

class FormVaildationSuccess extends SignInValidationState {}

class FormVaildationError extends SignInValidationState {
  final Map<String, String> errorMap;

  FormVaildationError(this.errorMap);
}
