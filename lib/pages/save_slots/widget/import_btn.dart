import 'package:aic_planner/shared/data/constants.dart';
import 'package:flutter/material.dart';

Widget importBtn(BuildContext context, {required VoidCallback onTap}) {
  return Positioned(
    top: -2,
    right: -2,
    child: GestureDetector(
      onTap: () {

      },
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppCustomColors.secondaryUI.withValues(alpha: 0.9),
            border: Border.all(color: Colors.white54, width: 2),
          ),
          child: Center(
            child: Icon(
              Icons.file_download_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    ),
  );
}
