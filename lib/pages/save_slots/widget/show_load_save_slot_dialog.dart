import 'package:aic_planner/shared/data/constants.dart';
import 'package:aic_planner/shared/model/save_slot.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Full-screen styled dialog for Loading/Deleting Save Slots
Future<void> showLoadSaveSlotDialog(
  BuildContext context, {
  required SaveSlot slot,
  required VoidCallback onLoad,
  required VoidCallback onShare,
  required VoidCallback onDelete,
}) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    useSafeArea: false,
    builder: (context) {
      return Stack(
        children: [
          const ModalBarrier(color: Colors.black54, dismissible: true),

          Center(
            child: Dialog(
              backgroundColor: const Color(0xFF1B1B1B),
              insetPadding: const EdgeInsets.symmetric(horizontal: 20),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 600,
                  maxWidth: 600,
                  minHeight: 300,
                  maxHeight: 300,
                ),
                child: IntrinsicHeight(
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B1B1B),
                      border: Border.all(
                        color: const Color(0xB3717171),
                        width: 2,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // --- LEFT SIDE: MAP PREVIEW ---
                        if (slot.mapImageBytes != null)
                          Container(
                            width: 155,
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                color: Colors.white54,
                                width: 1,
                              ),
                              color: slot.mapImageBytes == null
                                  ? AppCustomColors.secondaryUI.withValues(
                                      alpha: 0.6,
                                    )
                                  : null,
                              image: slot.mapImageBytes != null
                                  ? DecorationImage(
                                      image: MemoryImage(slot.mapImageBytes!),
                                      fit: BoxFit
                                          .contain, // zoom out to fit entire image
                                      alignment: Alignment.center,
                                      colorFilter: ColorFilter.mode(
                                        Colors.black.withValues(alpha: 0.25),
                                        BlendMode.darken,
                                      ),
                                    )
                                  : null,
                            ),
                          ),

                        const SizedBox(width: 24),

                        // --- RIGHT SIDE: INFO & ACTIONS ---
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // TOP ROW: TITLE + SHARE + DELETE
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      slot.title?.isNotEmpty == true
                                          ? slot.title!
                                          : 'Unnamed Slot',
                                      style: TextStyle(
                                        color: AppCustomColors.text,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  // Share Icon
                                  IconButton(
                                    onPressed: onShare,
                                    icon: const Icon(
                                      Icons.share,
                                      color: Colors.white70,
                                      size: 20,
                                    ),
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    tooltip: "Share Save",
                                  ),
                                  const SizedBox(width: 2),
                                  // Delete Icon
                                  IconButton(
                                    onPressed: onDelete,
                                    icon: const Icon(
                                      Icons.delete_outline,
                                      color: Colors.redAccent,
                                      size: 22,
                                    ),
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    tooltip: "Delete Save",
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),

                              // DESCRIPTION
                              Text(
                                slot.description?.isNotEmpty == true
                                    ? slot.description!
                                    : 'No description provided.',
                                style: TextStyle(
                                  color: AppCustomColors.text.withValues(
                                    alpha: 0.7,
                                  ),
                                  fontSize: 15,
                                ),
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),

                              // TIMESTAMP
                              if (slot.createdAt != null)
                                Text(
                                  'Created: ${DateFormat('dd/MMM/yyyy hh.mm a').format(slot.createdAt!).toUpperCase()}',
                                  style: TextStyle(
                                    color: AppCustomColors.text.withValues(
                                      alpha: 0.4,
                                    ),
                                    fontSize: 12,
                                  ),
                                ),

                              const Spacer(), // Pushes the buttons to the bottom
                              const SizedBox(height: 20),

                              // BOTTOM ROW: CANCEL + LOAD
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  _actionBtn(
                                    label: 'CANCEL',
                                    onTap: () => Navigator.pop(context),
                                    isPrimary: false,
                                  ),
                                  const SizedBox(width: 12),
                                  _actionBtn(
                                    label: 'LOAD SAVE',
                                    onTap: onLoad,
                                    isPrimary: true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

/// Styled button helper to maintain the game UI look
Widget _actionBtn({
  required String label,
  required VoidCallback onTap,
  bool isPrimary = false,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: isPrimary ? const Color(0xFF3D3D3D) : Colors.transparent,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: isPrimary ? Colors.white38 : Colors.white12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isPrimary ? Colors.white : Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 13,
          letterSpacing: 1.2,
        ),
      ),
    ),
  );
}
