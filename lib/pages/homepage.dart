import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:ticaret_hfa_mobile/utils/app_constant.dart';
import 'package:ticaret_hfa_mobile/utils/size_config.dart';
import 'package:ticaret_hfa_mobile/widgets/clip_shape.dart';
import 'package:ticaret_hfa_mobile/widgets/complaint_cards.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextField textField;
  double width90 = 0;
  double custFontSize = 5 * SizeConfig.textMultiplier;
  var textEditingController = TextEditingController();
  var maskTextInputFormatter = MaskTextInputFormatter(
      mask: "### ### ## ##", filter: {"#": RegExp(r'[0-9]')});
  List<String> litems = [
    "1",
    "2",
    "Third",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12"
  ];
  void changeFontSize(size) async {
    setState(() {
      custFontSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    width90 = MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () => {},
          child: Icon(Icons.add),
          foregroundColor: Colors.blueAccent,
          backgroundColor: Colors.orange[100],
          elevation: 2.0,
          mini: false,
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blueAccent,
          shape: CircularNotchedRectangle(),
          notchMargin: 4,
          child: Container(
            height: 50.0,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              TopClipShape(),
              Container(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        3 * SizeConfig.widthMultiplier, 0, 0, 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Flexible(
                                child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        3 * SizeConfig.widthMultiplier,
                                        0,
                                        0,
                                        0),
                                    child: Text(
                                      'Şikayetlerim',
                                      maxLines: 1,
                                      softWrap: false,
                                      textScaleFactor:
                                          SizeConfig.textMultiplier,
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                          color: AppConstant.grey,
                                          fontSize: 3,
                                          fontFamily: 'Gilroy',
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2 * SizeConfig.heightMultiplier,
                          ),
                        ])),
              ),
              Expanded(
                  child: new ListView.builder(
                      padding: EdgeInsets.fromLTRB(
                          1.5 * SizeConfig.heightMultiplier,
                          0 * SizeConfig.heightMultiplier,
                          0.0,
                          0.0),
                      itemCount: litems.length,
                      itemBuilder: (BuildContext ctxt, int Index) {
                        return Container(
                          child: Column(
                            children: <Widget>[
                              ComplaintCards(),
                            ],
                          ),
                        );
                      }))
            ],
          ),
        ));
  }
}
