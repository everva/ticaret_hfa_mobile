import 'package:flutter/material.dart';
import 'package:ticaret_hfa_mobile/utils/app_constant.dart';
import 'package:ticaret_hfa_mobile/utils/size_config.dart';
import 'package:ticaret_hfa_mobile/widgets/buttom_button_wizard.dart';
import 'package:ticaret_hfa_mobile/widgets/clip_shape_second.dart';

class CreateComplaintFirst extends StatefulWidget {
  @override
  _CreateComplaintFirstState createState() => _CreateComplaintFirstState();
}

class _CreateComplaintFirstState extends State<CreateComplaintFirst> {
  TextFormField titleField;
  TextFormField cityField;
  TextFormField districtField;
  TextFormField neighborhoodField;
  TextFormField streetField;
  TextFormField buildingNoField;
  final FocusNode titleFocus = FocusNode();
  final FocusNode cityFocus = FocusNode();
  final FocusNode districtFocus = FocusNode();
  final FocusNode neighborhoodFocus = FocusNode();
  final FocusNode streetFocus = FocusNode();
  final FocusNode buildingNoFocus = FocusNode();
  final titleController = TextEditingController();
  final cityController = TextEditingController();
  final districtController = TextEditingController();
  final neighborhoodController = TextEditingController();
  final streetController = TextEditingController();
  final buildingNoController = TextEditingController();
  bool isTitleValid = true;
  bool isCityValid = true;
  bool isDistrictValid = true;
  bool isneighborhoodValid = true;
  bool isstreetValid = true;
  bool isbuildNoValid = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextFormField getTitleField() {
    titleField = TextFormField(
      autofocus: true,
      controller: titleController,
      textInputAction: TextInputAction.next,
      focusNode: titleFocus,
      onFieldSubmitted: (term) {
        adNext();
      },
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppConstant.grey,
          fontSize: 3 * SizeConfig.textMultiplier),
      decoration: InputDecoration(
          labelText: 'İŞLETME UNVANI',
          // errorText: isAdValid ? null : 'Adınız Giriniz',
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppConstant.grey,
              fontSize: 20),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
    );
    return titleField;
  }

  TextFormField getCityField() {
    cityField = TextFormField(
      textInputAction: TextInputAction.next,
      focusNode: cityFocus,
      controller: cityController,
      onFieldSubmitted: (value) {
        adNext();
      },
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppConstant.grey,
          fontSize: 3 * SizeConfig.textMultiplier),
      decoration: InputDecoration(
          labelText: 'ŞEHİR',
          //    errorText: isSoyadValid ? null : 'Soyadınız Giriniz',
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppConstant.grey,
              fontSize: 20),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
    );
    return cityField;
  }

  TextFormField getDistrictField() {
    districtField = TextFormField(
      textInputAction: TextInputAction.next,
      focusNode: districtFocus,
      controller: districtController,
      onFieldSubmitted: (value) {
        adNext();
      },
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppConstant.grey,
          fontSize: 3 * SizeConfig.textMultiplier),
      decoration: InputDecoration(
          labelText: 'İLÇE',
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppConstant.grey,
              fontSize: 20),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
    );
    return districtField;
  }

  TextFormField getNeighborhoodField() {
    neighborhoodField = TextFormField(
      textInputAction: TextInputAction.next,
      focusNode: neighborhoodFocus,
      controller: neighborhoodController,
      onFieldSubmitted: (value) {
        adNext();
      },
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppConstant.grey,
          fontSize: 3 * SizeConfig.textMultiplier),
      decoration: InputDecoration(
          labelText: 'MAHALLE',
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppConstant.grey,
              fontSize: 20),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
    );
    return neighborhoodField;
  }

  TextFormField getStreetField() {
    streetField = TextFormField(
      textInputAction: TextInputAction.next,
      focusNode: streetFocus,
      controller: streetController,
      onFieldSubmitted: (value) {
        adNext();
      },
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppConstant.grey,
          fontSize: 3 * SizeConfig.textMultiplier),
      decoration: InputDecoration(
          labelText: 'CADDE/SOKAK',
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppConstant.grey,
              fontSize: 20),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
    );
    return streetField;
  }

  TextFormField getBuildingNoField() {
    buildingNoField = TextFormField(
      textInputAction: TextInputAction.done,
      focusNode: buildingNoFocus,
      controller: buildingNoController,
      onFieldSubmitted: (value) {},
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppConstant.grey,
          fontSize: 3 * SizeConfig.textMultiplier),
      decoration: InputDecoration(
          labelText: 'BİNA/KAPI NO',
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppConstant.grey,
              fontSize: 20),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
    );
    return buildingNoField;
  }

  fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  adNext() {
    isTitleValid = titleController.text.isNotEmpty;

    if (titleFocus.hasFocus) {
      fieldFocusChange(context, titleFocus, cityFocus);
    } else {
      isCityValid = cityController.text.isNotEmpty;
      if (isCityValid && isTitleValid) {
        cityFocus.unfocus();
        Navigator.pushNamed(context, AppConstant.pageCreateComplaintSecond);
      }
    }
    print(isTitleValid);
    print(isCityValid);
    print(isDistrictValid);
    print(isneighborhoodValid);
    print(isstreetValid);
    print(isbuildNoValid);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.initByContext(context);
    double width90 = MediaQuery.of(context).size.width * 0.9;
    return ButtomButtonWizard(
        onNextPressed: () => adNext(),
        onBackPressed: () => {
              if (cityFocus.hasFocus)
                {fieldFocusChange(context, cityFocus, titleFocus)}
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
                                                'Şikayet Edilen',
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
                                        getTitleField(),
                                        getCityField(),
                                        getDistrictField(),
                                        getNeighborhoodField(),
                                        getStreetField(),
                                        getBuildingNoField(),
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
