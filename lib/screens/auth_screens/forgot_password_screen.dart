import 'package:flutter/material.dart';
import 'package:vendr/utility/size_constants.dart';

import 'sign_up_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool valid = false;
  @override
  Widget build(BuildContext context) {
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
                  'هل نسيت كلمة السر؟',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: Color(0xff414453), fontWeight: FontWeight.bold),
                ),
                SizedBox(height: Sizes.dimen_10.h),
                Text(
                    'أدخل البريد الإلكتروني الخاص بك وسوف نرسل لك رابطًا لإعادة تعيين كلمة المرور الخاصة بك',
                    style: TextStyle(color: Color(0xff42424c))),
                SizedBox(height: Sizes.dimen_10.h),
                Text('البريد الإلكتروني'),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black87),
                  decoration: InputDecoration(
                    enabledBorder:
                        UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffdbdee5))),
                    focusedBorder:
                        UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff000000))),
                    hintStyle: TextStyle(color: Color(0xff999999)),
                    hintText: 'يرجى إدخال البريد الإلكتروني',
                  ),
                  onChanged: (value) {
                    if (value.contains('@') && value.contains('.')) {
                      setState(() {
                        valid = true;
                      });
                    } else {
                      setState(() {
                        valid = false;
                      });
                    }
                  },
                ),
                Container(
                  height: Sizes.dimen_16.h,
                  child: Text(
                    valid ? '' : 'يرجى ادخال بريد الكتروني صحيح',
                    style: TextStyle(fontSize: 12, color: Color(0xffaf2727)),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    color: valid ? Color(0xff3866de) : Color(0xffe3e5f1),
                    elevation: 0,
                    onPressed: () {},
                    child: Text('تسجيل الدخول', style: TextStyle(color: Colors.white)),
                  ),
                ),
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
}
