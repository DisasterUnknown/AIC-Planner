import 'package:aic_planner/pages/aic_planner/controller/aic_planner_controller.dart';
import 'package:flutter/material.dart';
import 'package:aic_planner/shared/data/constants.dart';

Future<void> showClearWorkspaceDialog({
  required BuildContext context,
  required AciPlannerController controller,
  required VoidCallback onConfirm,
}) async {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        backgroundColor: const Color(0xFF1B1B1B),
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
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
                  border: Border.all(color: const Color(0xB3717171), width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xB3717171).withValues(alpha: 0.4),
                      offset: const Offset(0, 4),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Title
                    Text(
                      'New Workspace?',
                      style: TextStyle(
                        color: AppCustomColors.text,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    // Description
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Make sure you have saved your current workspace before creating a new workspace. All unsaved changes will be lost.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: AppCustomColors.text.withValues(alpha: 0.7),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
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
                        // Clear
                        GestureDetector(
                          onTap: () async {
                            controller.clearFacilities();

                            if (!context.mounted) return;
                            Navigator.of(context).pop();
                            onConfirm();
                          },
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
                            child: const Text(
                              'New Workspace',
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
      );
    },
  );
}
