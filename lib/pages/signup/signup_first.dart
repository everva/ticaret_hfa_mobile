import 'package:flutter/material.dart';
import 'package:ticaret_hfa_mobile/utils/app_constant.dart';
import 'package:ticaret_hfa_mobile/utils/size_config.dart';
import 'package:ticaret_hfa_mobile/widgets/buttom_button_wizard.dart';
import 'package:ticaret_hfa_mobile/widgets/clip_shape.dart';

class SignupPageFirst extends StatefulWidget {
  @override
  _SignupPageFirstState createState() => _SignupPageFirstState();
}

class _SignupPageFirstState extends State<SignupPageFirst> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.initByContext(context);
    double width90 = MediaQuery.of(context).size.width * 0.9;
    return ButtomButtonWizard(
        onNextPressed: () =>
            {Navigator.pushNamed(context, AppConstant.pageSignUpSecond)},
        onBackPressed: () => {},
        child: new Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.white,
            body: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    TopClipShape(),
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
                                              3 * SizeConfig.widthMultiplier,
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
                                                color: Color.fromRGBO(
                                                    79, 79, 97, 1),
                                                fontSize: 5,
                                                fontFamily: 'Gilroy',
                                                fontWeight: FontWeight.w100),
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
                                    TextField(
                                      autofocus: true,
                                      decoration: InputDecoration(
                                          labelText: 'Ad',
                                          labelStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                          // hintText: 'EMAIL',
                                          // hintStyle: ,
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue))),
                                    ),
                                    SizedBox(
                                      height: 2 * SizeConfig.heightMultiplier,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                          labelText: 'Soyad',
                                          labelStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                          // hintText: 'EMAIL',
                                          // hintStyle: ,
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue))),
                                    ),
                                  ],
                                ),
                              )
                            ]))
                  ],
                ))));
  }
}
