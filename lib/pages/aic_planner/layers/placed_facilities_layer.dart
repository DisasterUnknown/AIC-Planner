import 'package:aic_planner/pages/aic_planner/controller/aci_planner_controller.dart';
import 'package:aic_planner/pages/aic_planner/widget/factory_widget.dart';
import 'package:flutter/material.dart';

class PlacedFacilitiesLayer extends StatelessWidget {
  final AciPlannerController controller;

  const PlacedFacilitiesLayer({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: controller.facilities
          .map(
            (f) => Positioned(
              left: f.position.dx,
              top: f.position.dy,
              child: FactoryWidget(
                factory: f,
                isDeleting: controller.deletingFactories.contains(f),
              ),
            ),
          )
          .toList(),
    );
  }
}
