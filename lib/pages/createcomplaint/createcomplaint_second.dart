import 'package:flutter/material.dart';
import 'package:ticaret_hfa_mobile/utils/app_constant.dart';
import 'package:ticaret_hfa_mobile/utils/size_config.dart';
import 'package:ticaret_hfa_mobile/widgets/buttom_button_wizard.dart';

import 'package:ticaret_hfa_mobile/widgets/clip_shape_second.dart';

import '../../utils/app_constant.dart';

class CreateComplaintSecond extends StatefulWidget {
  @override
  _CreateComplaintSecondState createState() => _CreateComplaintSecondState();
}

class _CreateComplaintSecondState extends State<CreateComplaintSecond> {
  TextFormField categoryField;
  TextFormField trademarkField;
  TextFormField explanationField;
  final FocusNode categoryFocus = FocusNode();
  final FocusNode trademarkFocus = FocusNode();
  final FocusNode explanationFocus = FocusNode();
  final categoryController = TextEditingController();
  final trademarkController = TextEditingController();
  final explanationController = TextEditingController();
  bool iscategoryValid = true;
  bool istrademarkValid = true;
  bool iexplanationValid = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextFormField getcategoryField() {
    categoryField = TextFormField(
      autofocus: true,
      controller: categoryController,
      textInputAction: TextInputAction.next,
      focusNode: categoryFocus,
      onFieldSubmitted: (term) {
        adNext();
      },
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppConstant.grey,
          fontSize: 3 * SizeConfig.textMultiplier),
      decoration: InputDecoration(
          labelText: 'KATEGORİ',
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppConstant.grey,
              fontSize: 20),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
    );
    return categoryField;
  }

  TextFormField gettrademarkField() {
    trademarkField = TextFormField(
      textInputAction: TextInputAction.done,
      focusNode: trademarkFocus,
      controller: trademarkController,
      onFieldSubmitted: (value) {
        adNext();
      },
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppConstant.grey,
          fontSize: 3 * SizeConfig.textMultiplier),
      decoration: InputDecoration(
          labelText: 'MARKA',
          //    errorText: isSoyadValid ? null : 'Soyadınız Giriniz',
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppConstant.grey,
              fontSize: 20),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
    );
    return trademarkField;
  }

  TextFormField getexplanationField() {
    explanationField = TextFormField(
      textInputAction: TextInputAction.done,
      maxLines: 2,
      focusNode: explanationFocus,
      controller: explanationController,
      onFieldSubmitted: (value) {
        adNext();
      },
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppConstant.grey,
          fontSize: 3 * SizeConfig.textMultiplier),
      decoration: InputDecoration(
          labelText: 'AÇIKLAMA',
          //    errorText: isSoyadValid ? null : 'Soyadınız Giriniz',
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppConstant.grey,
              fontSize: 20),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
    );
    return explanationField;
  }

  fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  adNext() {
    iscategoryValid = categoryController.text.isNotEmpty;

    if (categoryFocus.hasFocus) {
      fieldFocusChange(context, categoryFocus, trademarkFocus);
    } else {
      istrademarkValid = trademarkController.text.isNotEmpty;
      if (istrademarkValid && iscategoryValid) {
        trademarkFocus.unfocus();
        Navigator.pushNamed(context, AppConstant.pageHomePage);
      }
    }
    print(iscategoryValid);
    print(istrademarkValid);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.initByContext(context);
    double width90 = MediaQuery.of(context).size.width * 0.9;
    return ButtomButtonWizard(
        onNextPressed: () => adNext(),
        onBackPressed: () => {
              if (trademarkFocus.hasFocus)
                {fieldFocusChange(context, trademarkFocus, categoryFocus)}
            },
        child: new Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.white,
            body: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    TopClipShapeSecond(),
                    Expanded(
                        child: new ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(
                                left: 1.5 * SizeConfig.heightMultiplier),
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
                                                'Şikayet Konusu',
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
                                    ],
                                  ),
                                  Container(
                                    // padding: EdgeInsets.fromLTRB(
                                    //     0, 0, 0, 1 * SizeConfig.textMultiplier),
                                    width: width90,
                                    child: Column(
                                      children: <Widget>[
                                        getcategoryField(),
                                        gettrademarkField(),
                                        getexplanationField(),
                                        SizedBox(
                                          height:
                                              10 * SizeConfig.heightMultiplier,
                                        )
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
