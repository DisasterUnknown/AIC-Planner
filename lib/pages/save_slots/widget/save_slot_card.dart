import 'package:aci_planner/shared/data/constants.dart';
import 'package:flutter/material.dart';
import 'package:aci_planner/pages/save_slots/model/save_slot.dart';

class SaveSlotCard extends StatelessWidget {
  final SaveSlot slot;
  final VoidCallback onTap;

  const SaveSlotCard({
    super.key,
    required this.slot,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 250,
        decoration: BoxDecoration(
          color: AppCustomColors.secondaryUI.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: slot.isUsed
                ? AppCustomColors.selectedTiles
                : Colors.white54,
            width: 2,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Slot ${slot.index + 1}',
              style: TextStyle(
                color: AppCustomColors.text,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              slot.isUsed ? 'Saved Layout' : 'Empty Slot',
              style: TextStyle(
                color: AppCustomColors.text.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
