import 'package:flutter/material.dart';
import 'package:ticaret_hfa_mobile/pages/homepage.dart';
import 'package:ticaret_hfa_mobile/pages/signup/signup_first.dart';
import 'package:ticaret_hfa_mobile/pages/signup/signup_fifth.dart';
import 'package:ticaret_hfa_mobile/pages/signup/signup_second.dart';
import 'package:ticaret_hfa_mobile/pages/signup/signup_third.dart';
import 'package:ticaret_hfa_mobile/pages/signup/signup_forth.dart';

import 'pages/signup/signup_second.dart';
import 'pages/signup/signup_third.dart';
import 'utils/app_constant.dart';
import 'utils/size_config.dart';

void main() {
  runApp(HfaApp());
}

class HfaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme:
                    ThemeData(primarySwatch: Colors.blue, fontFamily: 'Gilroy'),
                title: 'HFA Uygulaması',
                initialRoute: AppConstant.pageHomePage,
                routes: {
                  AppConstant.pageSignUpFirst: (context) => SignupPageFirst(),
                  AppConstant.pageSignUpSecond: (context) => SignupPageSecond(),
                  AppConstant.pageSignUpThird: (context) => SignupPageThird(),
                  AppConstant.pageSignUpFourth: (context) => SignupPageForth(),
                  AppConstant.pageSignUpFifth: (context) => SignupPageFifth(),
                  AppConstant.pageHomePage: (context) => HomePage(),
                });
          },
        );
      },
    );
  }
}
