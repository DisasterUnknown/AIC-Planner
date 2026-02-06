import 'package:aic_planner/shared/data/constants.dart';
import 'package:flutter/material.dart';

Widget buildSaveOverlayerButton({
  required String title,
  required Color color,
  required VoidCallback onTap,
  double? width = 300,
  double? height = 50,
  double? fontSize = 20,
  double? iconSize = 25,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 27, 27, 27),
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: color, width: 2),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.4),
            offset: const Offset(0, 4),
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppCustomColors.text,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
