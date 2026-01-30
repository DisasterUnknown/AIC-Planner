import 'package:aic_planner/pages/aic_planner/model/facility_instance.dart';
import 'package:aic_planner/pages/aic_planner/widget/factory_widget.dart';
import 'package:flutter/material.dart';

class EditingFactoryLayer extends StatelessWidget {
  final FacilityInstance? editingFactory;
  final void Function(Offset newPos) onUpdate;
  final void Function(FacilityInstance placedFactory) onPlaced;
  final Offset Function(Offset) snapToGrid;

  const EditingFactoryLayer({
    super.key,
    required this.editingFactory,
    required this.onUpdate,
    required this.onPlaced,
    required this.snapToGrid,
  });

  @override
  Widget build(BuildContext context) {
    if (editingFactory == null) return const SizedBox.shrink();

    return Positioned(
      left: editingFactory!.position.dx,
      top: editingFactory!.position.dy,
      child: GestureDetector(
        onPanUpdate: (details) => onUpdate(details.delta),
        onPanEnd: (details) {
          final snappedPos = snapToGrid(editingFactory!.position);
          editingFactory!.position = snappedPos;
          onPlaced(editingFactory!);
        },
        child: Opacity(
          opacity: 0.7,
          child: FactoryWidget(factory: editingFactory!),
        ),
      ),
    );
  }
}
