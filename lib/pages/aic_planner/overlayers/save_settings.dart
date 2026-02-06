import 'package:aic_planner/pages/aic_planner/controller/aic_planner_controller.dart';
import 'package:aic_planner/pages/aic_planner/widget/overlayers/clear_workspace.dart';
import 'package:aic_planner/pages/aic_planner/widget/overlayers/save_as_infor_box.dart';
import 'package:aic_planner/pages/aic_planner/widget/overlayers/save_overlayer_btns.dart';
import 'package:aic_planner/shared/data/config/config.dart';
import 'package:aic_planner/shared/service/shared_pref_service.dart';
import 'package:aic_planner/shared/storage/hive_storage.dart';
import 'package:aic_planner/shared/widget/custom_snackbar.dart';
import 'package:flutter/material.dart';

class FullScreenOverlay extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onContinue;
  final Widget mapPreview;
  final AciPlannerController controller;

  const FullScreenOverlay({
    super.key,
    required this.onBack,
    required this.onContinue,
    required this.mapPreview,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        onTap: onBack,
        child: Material(
          color: Colors.black.withValues(alpha: 0.8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildSaveOverlayerButton(
                title: 'Save',
                color: const Color(0xB3717171),
                onTap: () async {
                  final String? saveSlotName =
                      await LocalSharedPreferences.getString(
                        AppConfig.sharedPrefSaveSlotKey,
                      );
                  debugPrint(saveSlotName);

                  if (saveSlotName == null && context.mounted) {
                    showSaveAsDialog(
                      context,
                      mapContent: mapPreview,
                      controller: controller,
                    );
                  } else if (context.mounted) {
                    final bool result = await PlannerSaveStorage.updateSlot(
                      facilities: controller.facilities,
                    );

                    if (result && context.mounted) {
                      showDarkStatusSnackBar(
                        context: context,
                        message: 'Saved',
                      );
                    } else if (context.mounted) {
                      showDarkStatusSnackBar(
                        context: context,
                        message: 'Failed to save',
                      );
                    }
                  }

                  onContinue;
                },
              ),
              const SizedBox(height: 15),

              buildSaveOverlayerButton(
                title: 'Save As',
                color: const Color(0xB3717171),
                onTap: () async {
                  final bool? result = await showSaveAsDialog(
                    context,
                    mapContent: mapPreview,
                    controller: controller,
                  );

                  if (result == true && context.mounted) {
                    showDarkStatusSnackBar(context: context, message: 'Saved');
                  } else if (result == false && context.mounted) {
                    showDarkStatusSnackBar(
                      context: context,
                      message: 'Failed to save',
                    );
                  }
                },
              ),
              const SizedBox(height: 15),

              buildSaveOverlayerButton(
                title: 'Load From',
                color: const Color(0xB3717171),
                onTap: onContinue,
              ),
              const SizedBox(height: 15),

              buildSaveOverlayerButton(
                title: 'New Workspace',
                color: const Color(0xB3717171),
                onTap: () {
                  showClearWorkspaceDialog(
                    context: context,
                    onConfirm: onContinue,
                    controller: controller,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
