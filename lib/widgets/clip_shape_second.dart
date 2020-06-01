import 'package:flutter/material.dart';
import 'package:ticaret_hfa_mobile/utils/custom_shape.dart';

import '../utils/size_config.dart';

class TopClipShapeSecond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.initByContext(context);
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: SizeConfig.heightMultiplier * 22,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue[700], Colors.blueAccent],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: SizeConfig.heightMultiplier * 20,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue[700], Colors.blueAccent],
                ),
              ),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                      child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        28 * SizeConfig.widthMultiplier, 35, 0, 0),
                    child: Text(
                      "Haksız Fiyat Artışı",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Gilroy",
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        30 * SizeConfig.widthMultiplier, 60, 0, 0),
                    child: Text(
                      "Şikayet Bildirimi",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Gilroy",
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
