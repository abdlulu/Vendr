part of 'sign_up_validation_bloc.dart';

@immutable
abstract class SignUpValidationState {}

class SignUpValidationInitial extends SignUpValidationState {}

class FormVaildationSuccess extends SignUpValidationState {}

class FormVaildationError extends SignUpValidationState {
  final Map<String, String> errorMap;

  FormVaildationError(this.errorMap);
}
