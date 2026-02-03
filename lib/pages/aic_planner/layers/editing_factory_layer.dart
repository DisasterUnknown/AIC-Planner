import 'package:aic_planner/pages/aic_planner/model/facility_instance.dart';
import 'package:aic_planner/pages/aic_planner/widget/factory_widget.dart';
import 'package:flutter/material.dart';

class EditingFactoryLayer extends StatelessWidget {
  final List<FacilityInstance> editingFactories;

  const EditingFactoryLayer({super.key, required this.editingFactories});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: editingFactories
          .map((f) => Positioned(
                left: f.position.dx,
                top: f.position.dy,
                child: Opacity(
                  opacity: 0.7,
                  child: FactoryWidget(factory: f),
                ),
              ))
          .toList(),
    );
  }
}
