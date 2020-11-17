part of 'sign_up_validation_bloc.dart';

@immutable
abstract class SignUpValidationEvent {}

class FirstNameChanged extends SignUpValidationEvent {
  final String text;

  FirstNameChanged(this.text);
}

class LastNameChanged extends SignUpValidationEvent {
  final String text;

  LastNameChanged(this.text);
}

class EmailChanged extends SignUpValidationEvent {
  final String text;

  EmailChanged(this.text);
}

class PasswordChanged extends SignUpValidationEvent {
  final String text;

  PasswordChanged(this.text);
}
