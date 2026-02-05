import 'package:aic_planner/pages/aic_planner/model/facility_instance.dart';
import 'package:flutter/material.dart';

class FactoryWidget extends StatelessWidget {
  final FacilityInstance factory;
  final bool isDeleting;

  const FactoryWidget({super.key, required this.factory, this.isDeleting = false});

  @override
  Widget build(BuildContext context) {
    final double cellSize = 20;
    final width = (factory.def.col) * cellSize;
    final height = (factory.def.row) * cellSize;

    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: factory.active ? Colors.blue : Colors.grey,
        border: isDeleting
            ? Border.all(color: Colors.red, width: 2)
            : Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        factory.def.name,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 12, color: Colors.white),
      ),
    );
  }
}
