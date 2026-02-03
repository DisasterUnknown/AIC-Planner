import 'package:aic_planner/pages/aic_planner/model/facility_instance.dart';
import 'package:aic_planner/pages/aic_planner/widget/ui_layer/cancle_btn.dart';
import 'package:aic_planner/pages/aic_planner/widget/ui_layer/facility_selection_btns.dart';
import 'package:aic_planner/pages/aic_planner/widget/ui_layer/option_btns.dart';
import 'package:aic_planner/shared/widget/corner_back_button.dart';
import 'package:flutter/material.dart';

class UIButtonsLayer extends StatelessWidget {
  final void Function(FacilityInstance) onAddFactory;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const UIButtonsLayer({
    super.key,
    required this.onAddFactory,
    required this.onCancel,
    required this.onConfirm,
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
        ),
        CancelButton(
          onTap: onCancel,
          label: 'Cancel',
          icon: Icons.cancel_outlined,
        ),
      ],
    );
  }
}
