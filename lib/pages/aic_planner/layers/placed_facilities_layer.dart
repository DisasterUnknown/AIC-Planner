import 'package:aic_planner/pages/aic_planner/model/facility_instance.dart';
import 'package:aic_planner/pages/aic_planner/widget/factory_widget.dart';
import 'package:flutter/material.dart';

class PlacedFacilitiesLayer extends StatelessWidget {
  final List<FacilityInstance> facilities;

  const PlacedFacilitiesLayer({super.key, required this.facilities});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: facilities
          .map((f) => Positioned(
                left: f.position.dx,
                top: f.position.dy,
                child: FactoryWidget(factory: f),
              ))
          .toList(),
    );
  }
}
