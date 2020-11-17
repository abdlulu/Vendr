part of 'sign_in_validation_bloc_.dart';

@immutable
abstract class SignInValidationEvent {}

class EmailChanged extends SignInValidationEvent {
  final String text;

  EmailChanged(this.text);
}

class PasswordChanged extends SignInValidationEvent {
  final String text;

  PasswordChanged(this.text);
}
