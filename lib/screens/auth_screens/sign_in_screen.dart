import 'package:flutter/material.dart';
import 'package:vendr/blocs/sign_in_validation_bloc/sign_in_validation_bloc_.dart';
import 'package:vendr/screens/auth_screens/forgot_password_screen.dart';
import 'package:vendr/screens/auth_screens/sign_up_screen.dart';
import 'package:vendr/utility/size_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> with SingleTickerProviderStateMixin {
  bool _obscureText = true;

  final inputDecoration = InputDecoration(
    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffdbdee5))),
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff000000))),
    hintStyle: TextStyle(color: Color(0xff999999)),
  );

  final txtStyle = TextStyle(fontWeight: FontWeight.w600, color: Colors.black87);

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
    Map errorMap = context.watch<SignInValidationBloc>().errorMap;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_48.w, vertical: Sizes.dimen_18.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(image: AssetImage('assets/logo.png'), height: Sizes.dimen_32.h),
                SizedBox(height: Sizes.dimen_4.h),
                Text(
                  'هلا فيك مرة ثانية!',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: Color(0xff414453), fontWeight: FontWeight.bold),
                ),
                SizedBox(height: Sizes.dimen_10.h),
                Text('البريد الإلكتروني'),
                buildTextField(
                  'يرجى إدخال البريد الإلكتروني',
                  TextInputType.emailAddress,
                  (value) => context.read<SignInValidationBloc>().add(EmailChanged(value)),
                ),
                Container(
                  height: Sizes.dimen_10.h,
                  child: Text(
                    errorMap['email'] != null ? errorMap['email'] : '',
                    style: TextStyle(fontSize: 12, color: Color(0xffaf2727)),
                  ),
                ),
                Text('كلمة المرور'),
                buildPasswordField(errorMap),
                Container(
                  height: Sizes.dimen_16.h,
                  child: Text(
                    errorMap['password'] != null ? errorMap['password'] : '',
                    style: TextStyle(fontSize: 12, color: Color(0xffaf2727)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
                  },
                  child: Text(
                    'هل نسيت كلمة السر؟',
                    style: TextStyle(color: Color(0xff42424c), fontSize: 16),
                  ),
                ),
                SizedBox(height: Sizes.dimen_12.h),
                buildSignInButton(),
                SizedBox(height: Sizes.dimen_12.h),
                Row(
                  children: [
                    Text('ليس لديك حساب؟'),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                      },
                      child: Text(' اشترك الآن',
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

  Widget buildPasswordField(errorMap) {
    return TextField(
      obscureText: _obscureText,
      style: txtStyle,
      onChanged: (value) => context.read<SignInValidationBloc>().add(PasswordChanged(value)),
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

  Widget buildSignInButton() {
    return BlocBuilder<SignInValidationBloc, SignInValidationState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: 50,
          child: RaisedButton(
            color: state is FormVaildationSuccess ? Color(0xff3866de) : Color(0xffe3e5f1),
            elevation: 0,
            onPressed: () {},
            child: Text('تسجيل الدخول', style: TextStyle(color: Colors.white)),
          ),
        );
      },
    );
  }
}
