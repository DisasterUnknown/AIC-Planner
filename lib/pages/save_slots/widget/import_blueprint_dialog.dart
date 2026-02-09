import 'package:aic_planner/shared/data/constants.dart';
import 'package:flutter/material.dart';

Future<void> showImportBlueprintDialog({
  required BuildContext context,
  required Function(String) onImport,
}) async {
  final TextEditingController importController = TextEditingController();

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
                    minHeight: 230, // Slightly taller for the input field
                    maxHeight: 230,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 27, 27, 27),
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(
                        color: const Color(0xB3717171),
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Title
                        Text(
                          'Import Blueprint',
                          style: TextStyle(
                            color: AppCustomColors.text,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 20),

                        // Input Field
                        TextField(
                          controller: importController,
                          maxLines: 1,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Paste blueprint code here...',
                            hintStyle: TextStyle(
                              color: Colors.white.withValues(alpha: 0.3),
                            ),
                            filled: true,
                            fillColor: const Color(0xFF121212),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 16,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: const BorderSide(
                                color: Color(0xB3717171),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: const BorderSide(
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        const SizedBox(height: 24),

                        // Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Cancel
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
                            // Import Button
                            GestureDetector(
                              onTap: () {
                                onImport(importController.text);
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  // Accent color for positive action
                                  color: const Color(0xFF424242),
                                  borderRadius: BorderRadius.circular(2),
                                  border: Border.all(color: Colors.white54),
                                ),
                                child: const Text(
                                  'Import',
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
        ],
      );
    },
  );
}
