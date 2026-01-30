import 'package:aic_planner/pages/aic_planner/model/facility_instance.dart';
import 'package:aic_planner/shared/data/registry/facility_registry.dart';
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
        Positioned(
          bottom: 20,
          left: 20,
          child: FloatingActionButton(
            onPressed: () {
              onAddFactory(
                FacilityInstance(
                  def: FacilityRegistry.kBeamTower,
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
