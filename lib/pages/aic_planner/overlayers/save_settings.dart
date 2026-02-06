import 'package:aic_planner/pages/aic_planner/widget/overlayers/save_as_infor_box.dart';
import 'package:aic_planner/pages/aic_planner/widget/overlayers/save_overlayer_btns.dart';
import 'package:aic_planner/shared/data/config/config.dart';
import 'package:aic_planner/shared/service/shared_pref_service.dart';
import 'package:flutter/material.dart';

class FullScreenOverlay extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onContinue;
  final Widget mapPreview;

  const FullScreenOverlay({
    super.key,
    required this.onBack,
    required this.onContinue,
    required this.mapPreview,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        onTap: onBack,
        child: Material(
          color: Colors.black.withValues(alpha: 0.8),
          child: SafeArea(
            child: Center(
              child: GestureDetector(
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          showSaveAsDialog(context, mapContent: mapPreview);
                        }

                        onContinue;
                      },
                    ),
                    const SizedBox(height: 15),

                    buildSaveOverlayerButton(
                      title: 'Save As',
                      color: const Color(0xB3717171),
                      onTap: () {
                        showSaveAsDialog(context, mapContent: mapPreview);
                      },
                    ),
                    const SizedBox(height: 15),

                    buildSaveOverlayerButton(
                      title: 'Load From',
                      color: const Color(0xB3717171),
                      onTap: onContinue,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
