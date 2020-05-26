import 'package:flutter/material.dart';
import 'package:ticaret_hfa_mobile/utils/app_constant.dart';
import 'package:ticaret_hfa_mobile/utils/size_config.dart';
import 'package:ticaret_hfa_mobile/widgets/buttom_button_wizard.dart';
import 'package:ticaret_hfa_mobile/widgets/clip_shape.dart';

class SignupPageThird extends StatefulWidget {
  @override
  _SignupPageThirdState createState() => _SignupPageThirdState();
}

class _SignupPageThirdState extends State<SignupPageThird> {
  TextField textField;
  double width90 = 0;
  double custFontSize = 7 * SizeConfig.textMultiplier;

  void changeFontSize(size) async {
    setState(() {
      custFontSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    width90 = MediaQuery.of(context).size.width * 0.9;
    return ButtomButtonWizard(
        onNextPressed: () =>
            {Navigator.pushNamed(context, AppConstant.pageSignUpFourth)},
        onBackPressed: () => {Navigator.pop(context)},
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
                                            'Lütfen T.C. Kimlik Numaranızı Giriniz',
                                            maxLines: 3,
                                            softWrap: false,
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                            textScaleFactor:
                                                SizeConfig.textMultiplier,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    79, 79, 97, 1),
                                                fontSize: 5,
                                                fontFamily: 'Gilroy',
                                                fontWeight: FontWeight.w100),
                                          ))),
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
                                  children: <Widget>[getField()],
                                ),
                              )
                            ]))
                  ],
                ))));
  }

  TextField getField() {
    textField = TextField(
      keyboardType: TextInputType.number,
      maxLength: 11,
      onChanged: (text) {
        _calculateFontSize('+' + text);
        print("First text field: $text");
      },
      autofocus: true,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(79, 79, 97, 1),
        fontSize: custFontSize,
      ),
      decoration: InputDecoration(
          labelText: 'TCKN',
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 3 * SizeConfig.textMultiplier,
              color: Color.fromRGBO(79, 79, 97, 1)),
          // hintText: 'EMAIL',
          // hintStyle: ,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );
    return textField;
  }

  void _calculateFontSize(key) {
    var wordWrapTp = TextPainter(
      text: TextSpan(
        style: textField.style,
        text: key,
      ),
      textAlign: textField.textAlign ?? TextAlign.left,
      textDirection: textField.textDirection ?? TextDirection.ltr,
      textScaleFactor: 1,
      maxLines: 1,
    );

    wordWrapTp.layout(maxWidth: width90);

    print('1-' + wordWrapTp.width.toString());
    print('2-' + width90.toString());
    print('3-' + wordWrapTp.didExceedMaxLines.toString());
    bool isExceed = wordWrapTp.didExceedMaxLines || wordWrapTp.width > width90;
    if (isExceed) {
      changeFontSize(custFontSize / 1.1);
    }
  }
}
