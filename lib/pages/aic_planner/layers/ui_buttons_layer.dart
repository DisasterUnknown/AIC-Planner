import 'package:aic_planner/pages/aic_planner/model/facility_instance.dart';
import 'package:aic_planner/pages/aic_planner/widget/ui_layer/cancle_btn.dart';
import 'package:aic_planner/pages/aic_planner/widget/ui_layer/option_btns.dart';
import 'package:aic_planner/shared/data/registry/facility_registry/facility_registry.dart';
import 'package:aic_planner/shared/widget/corner_back_button.dart';
import 'package:flutter/material.dart';

class UIButtonsLayer extends StatelessWidget {
  final void Function(FacilityInstance) onAddFactory;

  const UIButtonsLayer({super.key, required this.onAddFactory});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        cornerBackBtn(context),

        // Top save and infor btn area
        OptionButtons(
          version: 'v1.2.3',
          onSave: () {
            print('Save clicked');
          },
          onTree: () {
            print('Tree clicked');
          },
          onInfo: () {
            print('Info clicked');
          },
        ),

        // bottum right area

        // bottum left area
        CancelButton(
          onTap: () {},
          label: 'Cancel',
          icon: Icons.cancel_outlined,
        ),

        Positioned(
          bottom: 20,
          left: 600,
          child: FloatingActionButton(
            onPressed: () {
              onAddFactory(
                FacilityInstance(
                  def: FacilityRegistry.kPackagingUnit,
                  position: const Offset(0, 0),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
