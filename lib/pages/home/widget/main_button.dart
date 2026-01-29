import 'package:aic_planner/shared/data/constants.dart';
import 'package:flutter/material.dart';

Widget buildMainButton({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    double? width = 250,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 80,
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
            Icon(icon, color: AppCustomColors.text, size: 36),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                color: AppCustomColors.text,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }