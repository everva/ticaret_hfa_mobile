import 'package:flutter/material.dart';

class ButtomButtonWizard extends StatefulWidget {
  final Widget child;
  final VoidCallback onNextPressed;
  final VoidCallback onBackPressed;
  const ButtomButtonWizard(
      {Key key,
      @required this.child,
      @required this.onNextPressed,
      @required this.onBackPressed})
      : super(key: key);

  @override
  _ButtomButtonWizardState createState() => _ButtomButtonWizardState();
}

class _ButtomButtonWizardState extends State<ButtomButtonWizard> {
  @override
  Widget build(BuildContext context) {
    double width50 = MediaQuery.of(context).size.width * 0.5;
    double width100 = MediaQuery.of(context).size.width;

    Widget specialCharsPanel() {
      return Container(
        width: width100,
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.all(Radius.circular(0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ButtonTheme(
                  minWidth: width50,
                  height: 50,
                  child: FlatButton(
                      onPressed: () {
                        widget.onBackPressed();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.keyboard_arrow_left,
                            size: 30,
                          ),
                          Text('Geri!',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))
                        ],
                      ),
                      color: Colors.grey[300],
                      textColor: Colors.blue,
                      shape: Border(
                        right: BorderSide(width: 1.0, color: Colors.grey),
                      ))),
              ButtonTheme(
                  height: 50,
                  minWidth: width50,
                  child: FlatButton(
                      onPressed: () {
                        widget.onNextPressed();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('İleri',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: 30,
                          ),
                        ],
                      ),
                      color: Colors.grey[300],
                      textColor: Colors
                          .blue, //textColor: Color.fromRGBO(48, 85, 242, 1), //#3055F2,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(0.0),
                      ))),
            ],
          ),
        ),
      );
    }

    return new Scaffold(
        //  resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Positioned(
              child: widget.child,
            ),
            // Positioned(
            //   child: Align(
            //     alignment: FractionalOffset.bottomLeft,
            //     child: Padding(
            //         padding: EdgeInsets.fromLTRB(
            //             5 * SizeConfig.widthMultiplier, 0, 0, 60),
            //         child: Text(
            //           '* SMS Gönderilecektir...',
            //           maxLines: 3,
            //           softWrap: false,
            //           textAlign: TextAlign.start,
            //           overflow: TextOverflow.ellipsis,
            //           textScaleFactor: SizeConfig.textMultiplier,
            //           style: TextStyle(
            //               color: Color.fromRGBO(79, 79, 97, 0.5),
            //               fontSize: 2,
            //               fontFamily: 'Gilroy',
            //               fontWeight: FontWeight.bold),
            //         )),
            //   ),
            // ),
            Positioned(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: specialCharsPanel(),
              ),
            )
          ],
        ));
  }
}
