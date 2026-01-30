import 'dart:async';
import 'package:aic_planner/pages/aic_planner/layers/background_layer.dart';
import 'package:aic_planner/pages/aic_planner/layers/editing_factory_layer.dart';
import 'package:aic_planner/pages/aic_planner/layers/grid_layer.dart';
import 'package:aic_planner/pages/aic_planner/layers/placed_facilities_layer.dart';
import 'package:aic_planner/pages/aic_planner/layers/ui_buttons_layer.dart';
import 'package:aic_planner/pages/aic_planner/model/facility_instance.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

class AciPlannerPage extends StatefulWidget {
  const AciPlannerPage({super.key});

  @override
  State<AciPlannerPage> createState() => _AciPlannerPageState();
}

class _AciPlannerPageState extends State<AciPlannerPage> {
  final TransformationController _controller = TransformationController();
  final List<FacilityInstance> facilities = [];

  FacilityInstance? editingFactory;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    // Center the 2000x1000 world in the screen at start
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenSize = MediaQuery.of(context).size;
      final worldWidth = 2000.0;
      final worldHeight = 1000.0;

      final dx = (screenSize.width - worldWidth) / 2;
      final dy = (screenSize.height - worldHeight) / 2;

      _controller.value = Matrix4.identity()
        ..translateByVector3(Vector3(dx, dy, 0));
    });

    timer = Timer.periodic(const Duration(milliseconds: 100), (t) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  // Snap position to 30x30 grid
  Offset snapToGrid(Offset pos) {
    double x = (pos.dx / 20).round() * 20;
    double y = (pos.dy / 20).round() * 20;
    return Offset(x, y);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InteractiveViewer(
            clipBehavior: Clip.none,
            transformationController: _controller,
            panEnabled: true,
            scaleEnabled: true,
            minScale: 0.5,
            constrained: false,
            maxScale: 5.0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 3,
              height: MediaQuery.of(context).size.height * 3,
              child: Center(
                child: Stack(
                  children: [
                    BackgroundLayer(),
                    GridLayer(),
                    PlacedFacilitiesLayer(facilities: facilities),

                    EditingFactoryLayer(
                      editingFactory: editingFactory,
                      snapToGrid: snapToGrid,
                      onUpdate: (delta) {
                        setState(() {
                          editingFactory!.position += delta;
                        });
                      },
                      onPlaced: (placedFactory) {
                        setState(() {
                          facilities.add(placedFactory);
                          editingFactory = null;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          UIButtonsLayer(
            onAddFactory: (newFactory) {
              setState(() {
                editingFactory = newFactory;
              });
            },
          ),
        ],
      ),
    );
  }
}
