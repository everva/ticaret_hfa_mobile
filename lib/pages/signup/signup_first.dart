import 'package:flutter/material.dart';
import 'package:ticaret_hfa_mobile/utils/app_constant.dart';
import 'package:ticaret_hfa_mobile/utils/size_config.dart';
import 'package:ticaret_hfa_mobile/widgets/buttom_button_wizard.dart';
import 'package:ticaret_hfa_mobile/widgets/clip_shape.dart';

import '../../utils/app_constant.dart';
import '../../utils/app_constant.dart';

class SignupPageFirst extends StatefulWidget {
  @override
  _SignupPageFirstState createState() => _SignupPageFirstState();
}

class _SignupPageFirstState extends State<SignupPageFirst> {
  TextFormField adField;
  TextFormField soyadField;
  final FocusNode adFocus = FocusNode();
  final FocusNode soyadFocus = FocusNode();
  final adController = TextEditingController();
  final soyadController = TextEditingController();
  bool isAdValid = true;
  bool isSoyadValid = true;

  TextFormField getAdField() {
    adField = TextFormField(
      autofocus: true,
      controller: adController,
      textInputAction: TextInputAction.next,
      focusNode: adFocus,
      onFieldSubmitted: (term) {
        adNext();
      },
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppConstant.grey,
          fontSize: 3 * SizeConfig.textMultiplier),
      decoration: InputDecoration(
          labelText: 'ADI',
          //      errorText: isAdValid ? null : 'Adınız Giriniz',
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppConstant.grey,
              fontSize: 20),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
    );
    return adField;
  }

  TextFormField getSoyadField() {
    soyadField = TextFormField(
      textInputAction: TextInputAction.done,
      focusNode: soyadFocus,
      controller: soyadController,
      onFieldSubmitted: (value) {
        adNext();
      },
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppConstant.grey,
          fontSize: 3 * SizeConfig.textMultiplier),
      decoration: InputDecoration(
          labelText: 'SOYAD',
          //    errorText: isSoyadValid ? null : 'Soyadınız Giriniz',
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppConstant.grey,
              fontSize: 20),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
    );
    return soyadField;
  }

  fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  adNext() {
    isAdValid = adController.text.isNotEmpty;

    if (adFocus.hasFocus) {
      fieldFocusChange(context, adFocus, soyadFocus);
    } else {
      isSoyadValid = soyadController.text.isNotEmpty;
      if (isSoyadValid && isAdValid) {
        soyadFocus.unfocus();
        Navigator.pushNamed(context, AppConstant.pageSignUpSecond);
      }
    }
    print(isAdValid);
    print(isSoyadValid);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.initByContext(context);
    double width90 = MediaQuery.of(context).size.width * 0.9;
    return ButtomButtonWizard(
        onNextPressed: () => adNext(),
        onBackPressed: () => {
              if (soyadFocus.hasFocus)
                {fieldFocusChange(context, soyadFocus, adFocus)}
            },
        child: new Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.white,
            body: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    TopClipShape(),
                    Expanded(
                        child: new ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        SingleChildScrollView(
                            padding: EdgeInsets.fromLTRB(
                                1.5 * SizeConfig.heightMultiplier,
                                0 * SizeConfig.heightMultiplier,
                                0.0,
                                0.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Flexible(
                                          child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  3 *
                                                      SizeConfig
                                                          .widthMultiplier,
                                                  0,
                                                  0,
                                                  0),
                                              child: Text(
                                                'Kişisel Bilgileriniz',
                                                maxLines: 1,
                                                softWrap: false,
                                                textScaleFactor:
                                                    SizeConfig.textMultiplier,
                                                overflow: TextOverflow.fade,
                                                style: TextStyle(
                                                    color: AppConstant.grey,
                                                    fontSize: 5,
                                                    fontFamily: 'Gilroy',
                                                    fontWeight:
                                                        FontWeight.w100),
                                              ))),
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(0, 0, 0,
                                              2 * SizeConfig.textMultiplier),
                                          child: Text(
                                            ".",
                                            maxLines: 1,
                                            softWrap: false,
                                            overflow: TextOverflow.fade,
                                            textAlign: TextAlign.justify,
                                            textScaleFactor:
                                                SizeConfig.textMultiplier,
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 8),
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2 * SizeConfig.heightMultiplier,
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(
                                        0, 0, 0, 2 * SizeConfig.textMultiplier),
                                    width: width90,
                                    child: Column(
                                      children: <Widget>[
                                        getAdField(),
                                        SizedBox(
                                          height:
                                              2 * SizeConfig.heightMultiplier,
                                        ),
                                        getSoyadField(),
                                      ],
                                    ),
                                  )
                                ]))
                      ],
                    )),
                  ],
                ))));
  }
}
