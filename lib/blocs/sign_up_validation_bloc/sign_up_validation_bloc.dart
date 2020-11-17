import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_validation_event.dart';
part 'sign_up_validation_state.dart';

class SignUpValidationBloc extends Bloc<SignUpValidationEvent, SignUpValidationState> {
  SignUpValidationBloc() : super(SignUpValidationInitial());
  Map<String, String> errorMap = <String, String>{
    'firstName': null,
    'lastName': null,
    'email': null,
    'password': null
  };

  @override
  Stream<SignUpValidationState> mapEventToState(
    SignUpValidationEvent event,
  ) async* {
    if (event is FirstNameChanged) {
      if (event.text.length < 2) {
        errorMap['firstName'] = 'هذا الحقل مطلوب';
        yield FormVaildationError(errorMap);
      } else {
        errorMap['firstName'] = '';
        yield SignUpValidationInitial();
      }
    } else if (event is LastNameChanged) {
      if (event.text.length < 2) {
        errorMap['lastName'] = 'هذا الحقل مطلوب';
        yield FormVaildationError(errorMap);
      } else {
        errorMap['lastName'] = '';
        yield SignUpValidationInitial();
      }
    } else if (event is EmailChanged) {
      if (event.text.isEmpty) {
        errorMap['email'] = 'هذا الحقل مطلوب';
        yield FormVaildationError(errorMap);
      } else if (!event.text.contains('@') || !event.text.contains('.')) {
        errorMap['email'] = 'يرجى ادخال البريد الالكتروني بشكل صحيح';
        yield FormVaildationError(errorMap);
      } else {
        errorMap['email'] = '';
        yield SignUpValidationInitial();
      }
    } else if (event is PasswordChanged) {
      if (event.text.isEmpty) {
        errorMap['password'] = 'هذا الحقل مطلوب';
        yield FormVaildationError(errorMap);
      } else if (event.text.length < 8) {
        errorMap['password'] = 'يتطلب هذا الحقل 8 أحرف على الأقل';
        yield FormVaildationError(errorMap);
      } else {
        errorMap['password'] = '';
        yield SignUpValidationInitial();
      }
    }

    if (errorMap.values.toList().where((element) => element != null && element.isEmpty).length == 4)
      yield FormVaildationSuccess();
  }
}
