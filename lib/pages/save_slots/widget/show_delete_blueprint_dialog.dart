import 'package:aic_planner/shared/data/constants.dart';
import 'package:flutter/material.dart';

Future<void> showDeleteBlueprintDialog({
  required BuildContext context,
  required String? blueprintName,
  required VoidCallback onConfirm,
}) async {
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
              insetPadding: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 400,
                    maxWidth: 500,
                    minHeight: 240,
                    maxHeight: 240,
                  ),
                  child: IntrinsicHeight(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 27, 27, 27),
                        borderRadius: BorderRadius.circular(2),
                        border: Border.all(
                          color: const Color(0xB3717171),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(
                              0xB3717171,
                            ).withValues(alpha: 0.4),
                            offset: const Offset(0, 4),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Title updated
                          Text(
                            'Delete Blueprint?',
                            style: TextStyle(
                              color: AppCustomColors.text,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 22),
                          // Description updated
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              'Are you sure you want to delete "$blueprintName"? This action cannot be undone and the blueprint data will be permanently removed.',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: AppCustomColors.text.withValues(
                                  alpha: 0.7,
                                ),
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          // Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Cancel Button
                              GestureDetector(
                                onTap: () => Navigator.of(context).pop(),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF2C2C2C),
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(
                                      color: const Color(0xB3717171),
                                    ),
                                  ),
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppCustomColors.text,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              // Delete Button (Refactored logic)
                              GestureDetector(
                                onTap: () async {
                                  // Logic: Call your controller's delete method
                                  // controller.deleteBlueprint(blueprintName);

                                  if (!context.mounted) return;
                                  Navigator.of(context).pop();
                                  onConfirm(); // Trigger the callback to refresh UI
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFB71C1C),
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(
                                      color: const Color(0xFFD32F2F),
                                    ),
                                  ),
                                  child: const Text(
                                    'Delete Blueprint',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
