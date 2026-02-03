import 'package:aic_planner/pages/aic_planner/controller/aci_planner_controller.dart';
import 'package:aic_planner/pages/aic_planner/widget/factory_widget.dart';
import 'package:flutter/material.dart';

class EditingFactoryLayer extends StatelessWidget {
  final AciPlannerController controller;

  const EditingFactoryLayer({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: controller.editingFactories
          .map(
            (f) => Positioned(
              left: f.position.dx,
              top: f.position.dy,
              child: Opacity(opacity: 0.7, child: FactoryWidget(factory: f)),
            ),
          )
          .toList(),
    );
  }
}
