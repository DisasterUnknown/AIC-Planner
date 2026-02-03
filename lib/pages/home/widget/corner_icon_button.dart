import 'package:aic_planner/shared/data/constants.dart';
import 'package:flutter/material.dart';

Widget buildCornerIconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppCustomColors.secondaryUI,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white54, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.white54.withValues(alpha: 0.4),
              offset: const Offset(0, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }