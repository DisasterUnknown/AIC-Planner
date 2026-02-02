import 'package:flutter/material.dart';
import 'package:aic_planner/shared/data/constants.dart';

class OptionButtons extends StatelessWidget {
  final String version;
  final VoidCallback onSave;
  final VoidCallback onTree;
  final VoidCallback onInfo;

  const OptionButtons({
    super.key,
    this.version = 'v1.0.0',
    required this.onSave,
    required this.onTree,
    required this.onInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -2,
      right: -2,
      child: Column(
        children: [
          // Version label
          Container(
            height: 40,
            width: 165,
            decoration: BoxDecoration(
              color: AppCustomColors.secondaryUI.withValues(alpha: 0.8),
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

          // Buttons row
          Row(
            children: [
              _buildButton(
                icon: Icons.save_outlined,
                onTap: onSave,
              ),
              _buildButton(
                icon: Icons.account_tree_outlined,
                onTap: onTree,
              ),
              _buildButton(
                icon: Icons.info_outline_rounded,
                onTap: onInfo,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          color: AppCustomColors.secondaryUI.withValues(alpha: 0.8),
          border: Border.all(color: Colors.white54, width: 2),
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
}
