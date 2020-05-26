import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:ticaret_hfa_mobile/utils/size_config.dart';
import 'package:ticaret_hfa_mobile/widgets/buttom_button_wizard.dart';
import 'package:ticaret_hfa_mobile/widgets/clip_shape.dart';

class SignupPageFifth extends StatefulWidget {
  @override
  _SignupPageFifthState createState() => _SignupPageFifthState();
}

class _SignupPageFifthState extends State<SignupPageFifth> {
  TextField textField;
  double width90 = 0;
  double custFontSize = 5 * SizeConfig.textMultiplier;
  var textEditingController = TextEditingController();
  var maskTextInputFormatter = MaskTextInputFormatter(
      mask: "### ### ## ##", filter: {"#": RegExp(r'[0-9]')});

  void changeFontSize(size) async {
    setState(() {
      custFontSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    width90 = MediaQuery.of(context).size.width * 0.9;
    return ButtomButtonWizard(
        onNextPressed: () => {},
        onBackPressed: () => {Navigator.pop(context)},
        child: Scaffold(
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
                                            'Lütfen Cep Telefonu Numaranızı Giriniz',
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
                                  children: <Widget>[
                                    getField(),
                                    SizedBox(
                                      height: 2 * SizeConfig.heightMultiplier,
                                    )
                                  ],
                                ),
                              ),
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
                                            '* SMS Gönderilecektir.',
                                            maxLines: 3,
                                            softWrap: false,
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                            textScaleFactor:
                                                SizeConfig.textMultiplier,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    79, 79, 97, 0.5),
                                                fontSize: 2,
                                                fontFamily: 'Gilroy',
                                                fontWeight: FontWeight.bold),
                                          ))),
                                ],
                              ),
                            ]))
                  ],
                ))));
  }

  TextField getField() {
    textField = TextField(
      keyboardType: TextInputType.phone,
      controller: textEditingController,
      autocorrect: false,
      inputFormatters: [maskTextInputFormatter],
      autofocus: true,
      onChanged: (text) {
        _calculateFontSize('+' + text);
        print("First text field: $text");
      },
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(79, 79, 97, 1),
        fontSize: custFontSize,
      ),
      decoration: InputDecoration(
          labelText: 'CEP TELEFONU',
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 3 * SizeConfig.textMultiplier,
              color: Color.fromRGBO(79, 79, 97, 1)),
          prefixText: '+90 ',
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
    if (isExceed && custFontSize > 9) {
      changeFontSize(custFontSize / 1.2);
    }
  }
}
