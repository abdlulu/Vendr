import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_validation_event.dart';
part 'sign_in_validation_state.dart';

class SignInValidationBloc extends Bloc<SignInValidationEvent, SignInValidationState> {
  SignInValidationBloc() : super(SignInValidationInitial());
  Map<String, String> errorMap = <String, String>{'email': null, 'password': null};

  @override
  Stream<SignInValidationState> mapEventToState(
    SignInValidationEvent event,
  ) async* {
    if (event is EmailChanged) {
      if (event.text.isEmpty) {
        errorMap['email'] = 'هذا الحقل مطلوب';
        yield FormVaildationError(errorMap);
      } else if (!event.text.contains('@') || !event.text.contains('.')) {
        errorMap['email'] = 'يرجى ادخال البريد الالكتروني بشكل صحيح';
        yield FormVaildationError(errorMap);
      } else {
        errorMap['email'] = '';
        yield SignInValidationInitial();
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
        yield SignInValidationInitial();
      }
    }

    if (errorMap.values.toList().where((element) => element != null && element.isEmpty).length == 2)
      yield FormVaildationSuccess();
  }
}
