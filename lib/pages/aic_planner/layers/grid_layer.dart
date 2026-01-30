import 'package:aic_planner/pages/aic_planner/widget/grid_painter.dart';
import 'package:flutter/material.dart';

class GridLayer extends StatelessWidget {
  const GridLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: MediaQuery.of(context).size * 3,
      painter: GridPainter(),
    );
  }
}
