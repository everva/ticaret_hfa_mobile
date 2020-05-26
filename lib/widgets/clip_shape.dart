import 'package:flutter/material.dart';
import 'package:ticaret_hfa_mobile/utils/custom_shape.dart';

import '../utils/size_config.dart';

class TopClipShape extends StatelessWidget {
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
        Image.asset(
          'assets/images/logo_gold.png',
          height: SizeConfig.heightMultiplier * 18,
          width: SizeConfig.width,
        ),
      ],
    );
  }
}
