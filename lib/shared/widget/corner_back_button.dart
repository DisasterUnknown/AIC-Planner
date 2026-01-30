import 'package:aic_planner/shared/widget/corner_back_button_painter.dart';
import 'package:flutter/material.dart';

Widget cornerBackBtn(BuildContext context) {
  return Positioned(
    top: 0,
    left: 0,
    child: GestureDetector(
      onTap: () => Navigator.pop(context),
      child: CustomPaint(
        painter: CornerBackButtonPainter(alphaValue: 0.8),
        child: SizedBox(
          width: 100,
          height: 50,
          child: Center(
            child: Icon(
              Icons.subdirectory_arrow_left,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ),
    ),
  );
}
