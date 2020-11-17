import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendr/blocs/sign_up_validation_bloc/sign_up_validation_bloc.dart';
import 'package:vendr/utility/size_constants.dart';

import 'sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with SingleTickerProviderStateMixin {
  bool _obscureText = true;

  final inputDecoration = InputDecoration(
    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffdbdee5))),
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff000000))),
    hintStyle: TextStyle(color: Color(0xff999999)),
    contentPadding: EdgeInsets.only(left: 11, right: 3, top: 14, bottom: 14),
    errorStyle: TextStyle(fontSize: 9, height: 0.3, color: Color(0xffaf2727)),
  );

  final txtStyle = TextStyle(fontWeight: FontWeight.w600, color: Colors.black87);
  final errorTextStyle = TextStyle(fontSize: 12, color: Color(0xffaf2727));

  AnimationController _animationController;
  Animation _colorTween;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _colorTween =
        ColorTween(begin: Colors.grey[400], end: Colors.grey[50]).animate(_animationController)
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                _animationController.reverse();
              }
            },
          );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map errorMap = context.watch<SignUpValidationBloc>().errorMap;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_48.w, vertical: Sizes.dimen_18.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(image: AssetImage('assets/logo.png'), height: Sizes.dimen_32.h),
                SizedBox(height: Sizes.dimen_4.h),
                Text(
                  'إنشاء حساب جديد',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: Color(0xff414453), fontWeight: FontWeight.bold),
                ),
                SizedBox(height: Sizes.dimen_10.h),
                Text('الاسم الأول'),
                buildTextField(
                  'يرجى إدخال الاسم الأول',
                  TextInputType.name,
                  (value) => context.read<SignUpValidationBloc>().add(FirstNameChanged(value)),
                ),
                Container(
                  height: Sizes.dimen_10.h,
                  child: Text(
                    errorMap['firstName'] != null ? errorMap['firstName'] : '',
                    style: errorTextStyle,
                  ),
                ),
                Text('اسم العائلة'),
                buildTextField(
                  'يرجى إدخال اسم العائلة',
                  TextInputType.name,
                  (value) => context.read<SignUpValidationBloc>().add(LastNameChanged(value)),
                ),
                Container(
                  height: Sizes.dimen_10.h,
                  child: Text(
                    errorMap['lastName'] != null ? errorMap['lastName'] : '',
                    style: errorTextStyle,
                  ),
                ),
                Text('البريد الإلكتروني'),
                buildTextField(
                  'يرجى إدخال البريد الإلكتروني',
                  TextInputType.emailAddress,
                  (value) => context.read<SignUpValidationBloc>().add(EmailChanged(value)),
                ),
                Container(
                  height: Sizes.dimen_10.h,
                  child: Text(
                    errorMap['email'] != null ? errorMap['email'] : '',
                    style: errorTextStyle,
                  ),
                ),
                Text('كلمة المرور'),
                buildPasswordField(),
                Container(
                  height: Sizes.dimen_16.h,
                  child: Text(
                    errorMap['password'] != null ? errorMap['password'] : '',
                    style: errorTextStyle,
                  ),
                ),
                buildSignUpButton(),
                SizedBox(height: Sizes.dimen_16.h),
                Row(
                  children: [
                    Text('هل لديك حساب بالفعل؟'),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) => SignInScreen()));
                      },
                      child: Text(' تسجيل الدخول',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hintText, TextInputType keyboardType, Function onChanged) {
    return TextField(
      keyboardType: keyboardType,
      style: txtStyle,
      decoration: inputDecoration.copyWith(hintText: hintText),
      onChanged: onChanged,
    );
  }

  Widget buildPasswordField() {
    return TextField(
      obscureText: _obscureText,
      style: txtStyle,
      onChanged: (value) => context.read<SignUpValidationBloc>().add(PasswordChanged(value)),
      decoration: inputDecoration.copyWith(
        hintText: 'يرجى إدخال كلمة المرور',
        suffixIcon: IconButton(
          splashColor: Colors.transparent,
          icon: AnimatedBuilder(
            animation: _colorTween,
            builder: (context, child) => Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: _colorTween.value,
              size: Sizes.dimen_20,
            ),
          ),
          onPressed: () {
            setState(() {
              _animationController.forward();
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
    );
  }

  Widget buildSignUpButton() {
    return BlocBuilder<SignUpValidationBloc, SignUpValidationState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: 50,
          child: RaisedButton(
            color: state is FormVaildationSuccess ? Color(0xff3866de) : Color(0xffe3e5f1),
            elevation: 0,
            onPressed: () {},
            child: Text('اشترك الآن', style: TextStyle(color: Colors.white)),
          ),
        );
      },
    );
  }
}
