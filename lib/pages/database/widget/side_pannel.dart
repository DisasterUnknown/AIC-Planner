import 'package:flutter/material.dart';
import 'package:aic_planner/shared/data/constants.dart';

class SidePannel extends StatelessWidget {
  final String version;

  const SidePannel({
    super.key,
    this.version = 'v1.0.0',
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: -2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Version label
          Container(
            height: 40,
            width: 98,
            decoration: BoxDecoration(
              color: AppCustomColors.secondaryUI.withValues(alpha: 0.9),
              border: Border.all(color: Colors.white54, width: 2),
            ),
            child: Center(
              child: Text(
                version,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
