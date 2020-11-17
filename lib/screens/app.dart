import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendr/blocs/sign_in_validation_bloc/sign_in_validation_bloc_.dart';
import 'package:vendr/blocs/sign_up_validation_bloc/sign_up_validation_bloc.dart';
import 'package:vendr/screens/home_screen/home_screen.dart';
import 'package:vendr/utility/screen_util.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignUpValidationBloc>(
          create: (BuildContext context) => SignUpValidationBloc(),
        ),
        BlocProvider<SignInValidationBloc>(
          create: (BuildContext context) => SignInValidationBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Vendr',
        theme: ThemeData(
          fontFamily: 'Cairo',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            // bodyText1: TextStyle(),
            bodyText2: TextStyle(color: Color(0xff8d8f9c)),
            // headline1: TextStyle(),
            // headline2: TextStyle(),
            // headline3: TextStyle(),
            // headline4: TextStyle(),
            // headline5: TextStyle(),
            // headline6: TextStyle(),
            // button: TextStyle(),
            // subtitle1: TextStyle(),
            // subtitle2: TextStyle(),
          ),
          cursorColor: Color(0xff0e8371),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
