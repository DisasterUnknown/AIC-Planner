import 'package:aic_planner/shared/data/constants.dart';
import 'package:flutter/material.dart';
import 'package:aic_planner/shared/model/save_slot.dart';

class SaveSlotCard extends StatelessWidget {
  final SaveSlot slot;
  final VoidCallback onTap;

  const SaveSlotCard({super.key, required this.slot, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white54, width: 2),
          color: slot.mapImageBytes == null
              ? AppCustomColors.secondaryUI.withValues(alpha: 0.6)
              : null,
          image: slot.mapImageBytes != null
              ? DecorationImage(
                  image: MemoryImage(slot.mapImageBytes!),
                  fit: BoxFit.contain, // zoom out to fit entire image
                  alignment: Alignment.center,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withValues(alpha: 0.25),
                    BlendMode.darken,
                  ),
                )
              : null,
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              slot.title != null && slot.title!.isNotEmpty
                  ? slot.title!
                  : 'Slot ${slot.index + 1}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 4,
                    color: Colors.black,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              slot.description != null && slot.description!.isNotEmpty
                  ? slot.description!
                  : 'Empty Slot',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 14,
                shadows: const [
                  Shadow(
                    blurRadius: 2,
                    color: Colors.black,
                    offset: Offset(1, 1),
                  ),
                ],
                overflow: TextOverflow.ellipsis,
              ),
              textAlign: TextAlign.justify,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
