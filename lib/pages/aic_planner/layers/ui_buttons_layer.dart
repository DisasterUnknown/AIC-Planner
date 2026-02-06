import 'package:aic_planner/pages/aic_planner/controller/aic_planner_controller.dart';
import 'package:aic_planner/pages/aic_planner/layers/background_layer.dart';
import 'package:aic_planner/pages/aic_planner/layers/grid_layer.dart';
import 'package:aic_planner/pages/aic_planner/layers/placed_facilities_layer.dart';
import 'package:aic_planner/pages/aic_planner/overlayers/save_settings.dart';
import 'package:aic_planner/pages/aic_planner/widget/ui_layer/cancle_btn.dart';
import 'package:aic_planner/pages/aic_planner/widget/ui_layer/facility_selection_btns.dart';
import 'package:aic_planner/pages/aic_planner/widget/ui_layer/option_btns.dart';
import 'package:aic_planner/shared/widget/corner_back_button.dart';
import 'package:flutter/material.dart';

class UIButtonsLayer extends StatefulWidget {
  final AciPlannerController controller;
  const UIButtonsLayer({super.key, required this.controller});

  @override
  State<UIButtonsLayer> createState() => _UIButtonsLayerState();
}

class _UIButtonsLayerState extends State<UIButtonsLayer> {
  final ValueNotifier<bool> showSaveOverlay = ValueNotifier(false);
  final ValueNotifier<bool> showTreeOverlay = ValueNotifier(false);
  final ValueNotifier<bool> showInfoOverlay = ValueNotifier(false);

  @override
  void dispose() {
    showSaveOverlay.dispose();
    showTreeOverlay.dispose();
    showInfoOverlay.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        cornerBackBtn(context),

        OptionButtons(
          version: 'v1.2.3',
          onSave: () => showSaveOverlay.value = true,
          onTree: () => showTreeOverlay.value = true,
          onInfo: () => showInfoOverlay.value = true,
        ),

        FacilitySelectionButtons(controller: widget.controller),
        widget.controller.showCancelBtn()
            ? CancelButton(
                onTap: widget.controller.cancelEditing,
                label: 'Cancel',
                icon: Icons.cancel_outlined,
              )
            : const SizedBox(),

        // ValueNotifier Overlays
        ValueListenableBuilder<bool>(
          valueListenable: showSaveOverlay,
          builder: (_, visible, __) {
            if (!visible) return const SizedBox.shrink();

            return FullScreenOverlay(
              onBack: () => showSaveOverlay.value = false,
              onContinue: () => showSaveOverlay.value = false,
              controller: widget.controller,
              mapPreview: mapPreview,
            );
          },
        ),
      ],
    );
  }

  late Widget mapPreview = SizedBox(
    width: MediaQuery.of(context).size.width * 3,
    height: MediaQuery.of(context).size.height * 3,
    child: Stack(
      children: [
        const BackgroundLayer(),
        const GridLayer(),
        PlacedFacilitiesLayer(controller: widget.controller),
      ],
    ),
  );
}
