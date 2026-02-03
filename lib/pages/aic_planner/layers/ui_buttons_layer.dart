import 'package:aic_planner/pages/aic_planner/controller/aci_planner_controller.dart';
import 'package:aic_planner/pages/aic_planner/model/facility_instance.dart';
import 'package:aic_planner/pages/aic_planner/widget/ui_layer/cancle_btn.dart';
import 'package:aic_planner/pages/aic_planner/widget/ui_layer/facility_selection_btns.dart';
import 'package:aic_planner/pages/aic_planner/widget/ui_layer/option_btns.dart';
import 'package:aic_planner/shared/widget/corner_back_button.dart';
import 'package:flutter/material.dart';

class UIButtonsLayer extends StatelessWidget {
  final void Function(FacilityInstance) onAddFactory;
  final bool Function() onCancelShow;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;
  final AciPlannerController controller;

  const UIButtonsLayer({
    super.key,
    required this.onAddFactory,
    required this.onCancel,
    required this.onConfirm,
    required this.onCancelShow,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        cornerBackBtn(context),
        OptionButtons(
          version: 'v1.2.3',
          onSave: () {},
          onTree: () {},
          onInfo: () {},
        ),
        FacilitySelectionButtons(
          onConfirm: onConfirm,
          onAddFactory: onAddFactory,
          controller: controller,
        ),
        onCancelShow()
            ? CancelButton(
                onTap: onCancel,
                label: 'Cancel',
                icon: Icons.cancel_outlined,
              )
            : const SizedBox(),
      ],
    );
  }
}
